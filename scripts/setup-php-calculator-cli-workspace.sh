#!/usr/bin/env bash
set -Eeuo pipefail

# Prépare un workspace pour le benchmark php-calculator-cli.
#
# Usage :
#   ./scripts/setup-php-calculator-cli-workspace.sh
#
# Options :
#   --workspace PATH              Dossier cible du benchmark
#   --benchmark-repo PATH         Chemin local du dépôt ai-agent-benchmarks
#   --with-claude-guardrails      Copie CLAUDE.md dans le projet cible
#   --force                       Supprime/recrée le workspace s’il existe déjà
#   --no-commit                   Prépare sans commit initial
#   -h, --help                    Affiche l’aide

DEFAULT_WORKSPACE="$HOME/dev/bench-php-calculator-cli"
WORKSPACE="$DEFAULT_WORKSPACE"
BENCHMARK_REPO=""
WITH_CLAUDE_GUARDRAILS=0
FORCE=0
DO_COMMIT=1

fail() {
  echo "Erreur : $*" >&2
  exit 1
}

info() {
  echo "==> $*"
}

help() {
  grep '^#' "$0" | sed 's/^# \{0,1\}//'
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "commande introuvable : $1"
}

detect_benchmark_repo() {
  if [ -n "$BENCHMARK_REPO" ]; then
    return
  fi

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  CANDIDATE="$(cd "$SCRIPT_DIR/.." && pwd -P)"

  if [ -f "$CANDIDATE/templates/rapport-log-template.md" ]; then
    BENCHMARK_REPO="$CANDIDATE"
    return
  fi

  if [ -f "$HOME/dev/ai-agent-benchmarks/templates/rapport-log-template.md" ]; then
    BENCHMARK_REPO="$HOME/dev/ai-agent-benchmarks"
    return
  fi

  fail "impossible de détecter le dépôt ai-agent-benchmarks. Utilise --benchmark-repo PATH"
}

while [ $# -gt 0 ]; do
  case "$1" in
    --workspace)
      WORKSPACE="$2"
      shift 2
      ;;
    --benchmark-repo)
      BENCHMARK_REPO="$2"
      shift 2
      ;;
    --with-claude-guardrails)
      WITH_CLAUDE_GUARDRAILS=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --no-commit)
      DO_COMMIT=0
      shift
      ;;
    -h|--help)
      help
      exit 0
      ;;
    *)
      fail "option inconnue : $1"
      ;;
  esac
done

need_cmd git
need_cmd docker

docker compose version >/dev/null 2>&1 || fail "Docker Compose v2 est requis"

detect_benchmark_repo

BENCHMARK_REPO="$(cd "$BENCHMARK_REPO" && pwd -P)"
WORKSPACE="${WORKSPACE/#\~/$HOME}"

RAPPORT_TEMPLATE="$BENCHMARK_REPO/templates/rapport-log-template.md"
CLAUDE_TEMPLATE="$BENCHMARK_REPO/templates/php-calculator-cli/CLAUDE-benchmark-guardrails.md"
PROMPTS_FILE="$BENCHMARK_REPO/prompts/php-calculator-cli/prompts-tests-1-22.md"

[ -f "$RAPPORT_TEMPLATE" ] || fail "template rapport introuvable : $RAPPORT_TEMPLATE"

if [ -e "$WORKSPACE" ] && [ "$(find "$WORKSPACE" -mindepth 1 -maxdepth 1 | wc -l)" -gt 0 ]; then
  if [ "$FORCE" -eq 1 ]; then
    info "Suppression du workspace existant : $WORKSPACE"
    rm -rf "$WORKSPACE"
  else
    fail "le workspace existe déjà et n’est pas vide : $WORKSPACE
Utilise --force ou choisis un autre dossier avec --workspace."
  fi
fi

info "Création du workspace : $WORKSPACE"
mkdir -p "$WORKSPACE"
cd "$WORKSPACE"

info "Initialisation Git"
git init

info "Création du docker-compose.yml minimal"
cat > docker-compose.yml <<'EOF'
services:
  php:
    image: php:8.4-cli
    working_dir: /app
    volumes:
      - ./:/app
EOF

info "Copie de rapport.log"
cp "$RAPPORT_TEMPLATE" rapport.log

if [ "$WITH_CLAUDE_GUARDRAILS" -eq 1 ]; then
  [ -f "$CLAUDE_TEMPLATE" ] || fail "template CLAUDE introuvable : $CLAUDE_TEMPLATE"
  info "Copie de CLAUDE.md"
  cp "$CLAUDE_TEMPLATE" CLAUDE.md
fi

info "Vérification PHP via Docker"
docker compose run --rm php php -v

if [ "$DO_COMMIT" -eq 1 ]; then
  info "Commit initial"
  git add .
  git commit -m "init benchmark workspace"
fi

echo
echo "Workspace prêt."
echo
echo "Projet cible :"
echo "  $WORKSPACE"
echo
echo "Dépôt benchmark :"
echo "  $BENCHMARK_REPO"
echo
echo "Fichier de prompts :"
echo "  $PROMPTS_FILE"
echo
echo "Commande de test principale :"
echo "  docker compose run --rm php php tests/CalculatorTest.php"
echo
echo "Prochaine étape :"
echo "  cd \"$WORKSPACE\""
echo "  claude --model deepseek-v4-flash:cloud --permission-mode auto"
echo
echo "Puis envoyer le prompt d’initialisation et le Test 1."
echo
git status
