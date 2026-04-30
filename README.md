# ai-agent-benchmarks
A collection of reproducible benchmarks for AI coding agents, with prompts, test scenarios, and model-by-model results.

# AI Agent Benchmarks

Dépôt public de prompts, scénarios de tests et résultats pour comparer des agents IA de développement.

Objectif : exécuter des séries de tests reproductibles sur différents agents et modèles, puis comparer leurs résultats à partir d’un rapport standardisé.

Exemples d’agents ou modèles testables :

- Claude Code
- Codex CLI
- Aider
- OpenCode
- modèles OpenAI
- modèles Anthropic
- modèles DeepSeek
- modèles Qwen
- modèles locaux ou cloud via Ollama

---

# Structure recommandée du dépôt

```text
ai-agent-benchmarks/
├── README.md
├── benchmark-init-prompt.md
├── prompts/
│   └── php-calculator-cli/
│       └── prompts-benchmark-agents-ia-php-tests-1-22.md
├── results/
│   └── php-calculator-cli/
│       └── <agent>-<modele>.md
└── templates/
    ├── rapport-log-template.md
    └── result-summary-template.md
```

---

# Principe général

Le dépôt `ai-agent-benchmarks` contient les prompts et les templates.

Le projet testé doit être dans un **répertoire de travail séparé**, par exemple :

```text
~/dev/bench-php-calculator-cli
```

Il ne faut pas faire les tests directement dans le dépôt `ai-agent-benchmarks`.

Schéma recommandé :

```text
~/dev/
├── ai-agent-benchmarks/   # dépôt public avec prompts, templates et résultats
└── bench-php-calculator-cli/              # projet vide utilisé pour exécuter le benchmark
```

---

# Prérequis

## Côté machine

- Linux ou WSL2 Debian/Ubuntu
- Docker installé
- Docker Compose v2 installé
- Git installé
- Un agent IA de développement installé ou accessible

Vérifier Docker :

```bash
docker --version
docker compose version
```

Vérifier Git :

```bash
git --version
```

---

# 1. Cloner le dépôt de benchmark

```bash
cd ~/dev
git clone https://github.com/Nicolas-Henry/ai-agent-benchmarks.git
```

Puis :

```bash
cd ~/dev/ai-agent-benchmarks
ls -al
```

---

# 2. Créer un répertoire de travail vide pour le test

Créer un projet vide séparé :

```bash
mkdir -p ~/dev/bench-php-calculator-cli
cd ~/dev/bench-php-calculator-cli
```

Initialiser Git :

```bash
git init
```

Vérifier :

```bash
git status
```

---

# 3. Associer le projet à Docker

Pour la série `php-calculator-cli`, le projet testé doit disposer d’un environnement Docker avec un service nommé `php`.

Créer un fichier `docker-compose.yml` minimal :

```bash
cat > docker-compose.yml <<'EOF'
services:
  php:
    image: php:8.4-cli
    working_dir: /app
    volumes:
      - ./:/app
EOF
```

Vérifier que PHP fonctionne dans Docker :

```bash
docker compose run --rm php php -v
```

La sortie doit indiquer PHP 8.4.

Exemple attendu :

```text
PHP 8.4.x (cli)
```

---

# 4. Créer le rapport de benchmark

Copier le template de rapport depuis le dépôt `ai-agent-benchmarks` vers le projet testé :

```bash
cp ~/dev/ai-agent-benchmarks/templates/rapport-log-template.md ./rapport.log
```

Vérifier :

```bash
ls -al rapport.log
```

Le fichier `rapport.log` sera mis à jour par l’agent après chaque test.

---

# 5. Premier commit de base

Faire un premier commit avec l’environnement Docker et le rapport initial :

```bash
git add .
git commit -m "init benchmark workspace"
```

Vérifier que le dossier est propre :

```bash
git status
```

---

# 6. Préparer le prompt d’initialisation

Exemple de commande pour lancer Claude avec un modèle
```
claude --model deepseek-v4-flash:cloud --permission-mode auto
```

Avant de lancer le test 1, envoyer à l’agent le prompt d’initialisation disponible ici :

[benchmark init prompt MD](https://github.com/Nicolas-Henry/ai-agent-benchmarks/blob/main/benchmark-init-prompt.md)

Sur cette page vous aurez un exemple à adapter pour votre cas. Copier le dans un éditeur de texte et changer les valeurs des variables.

Puis copier le code dans la console Claude : 

```
Voici les variables de prompt; attends mes instructions : [AJOUTER LES VARIABLES DE PROMPT] (coller)
```

Ce prompt permet de fixer :

- la date du benchmark ;
- l’auteur ;
- l’agent testé ;
- le modèle testé ;
- le runtime ;
- le chemin du projet cible ;
- le chemin du dépôt `ai-agent-benchmarks` ;
- le chemin du fichier de prompts ;
- le chemin du template de rapport ;
- la commande de test principale.

---

# 7. Prompt d’initialisation à envoyer à l’agent

Toujours sur cette page vous avez un exemple de briefing à copier coller tel quel. Il contient les noms de variables de prompt précédement défini. Cela permet de le copier tel quel.
[](/ai-agent-benchmarks/blob/main/benchmark-init-prompt.md)

L’agent doit ensuite répondre qu’il attend le prompt du test à exécuter.

Pour être certain qu'il a bien lu (ou qu'il compte les lire au moment voulu) vous pouvez écrire ce prompt:

```
lire les 22 tests
```

Réponse possible : 
```
Je vais lire les 22 tests depuis le fichier de prompts. Permettez-moi d'accéder au dépôt de
  benchmark pour voir les prompts.
```

---

# 8. Lancer le test 1

## Version manuelle (pour tester manuellement mais passer à la rubrique Version Auto pour aller plus vite)

Ouvrir le fichier de prompts :

```bash
cat ~/dev/ai-agent-benchmarks/prompts/php-calculator-cli/prompts-benchmark-agents-ia-php-tests-1-22.md
```

Copier uniquement le bloc :

```text
Test 1 — Création d’une base PHP simple
```

Puis l’envoyer à l’agent.

L’agent doit alors :

1. lire les fichiers existants ;
2. vérifier `git status` ;
3. créer la base PHP ;
4. lancer les tests avec Docker ;
5. mettre à jour `rapport.log` ;
6. exécuter `git diff --check` ;
7. faire :

```bash
git add .
git commit -m "test01: create basic calculator project"
```

8. afficher le hash du commit final.

---
## Version Auto

Ecrire simplement "Faire le test 1"

L'agent saura normalement le récupéer via le dépôt local (prompts/php-calculator-cli/prompts-benchmark-agents-ia-php-tests-1-22.md) spécifié dans le prompt d'initialisation.

# 10. Vérifier après le test 1

(pas obligatoire car tout sera écrit dans le rapport.log)

Après le retour de l’agent, vérifier manuellement :

```bash
git status
git log --oneline -3
cat rapport.log
```

Vérifier aussi les tests :

```bash
docker compose run --rm php php tests/CalculatorTest.php
```

Le working tree doit être propre.

---

# 9. Continuer avec les tests suivants

Répéter le même fonctionnement pour chaque test :

1. envoyer uniquement le prompt du test suivant ; => en Auto écrire simplement "Faire le test 2" 
2. laisser l’agent travailler ;
3. vérifier le résultat ; (pas obligatoire)
4. vérifier `rapport.log` ;  (pas obligatoire)
5. vérifier le commit ;  (pas obligatoire)
6. passer au test suivant. (Prompt : "Faire le test 3") etc ...

Exemple de prompt (en manuel) :

```text
Faire le test 2
```

---

# 10. Règles importantes pendant les tests

## Ne pas utiliser PHP local

Pour la série PHP, l’agent ne doit pas utiliser :

```bash
php tests/CalculatorTest.php
```

Il doit utiliser :

```bash
docker compose run --rm php php tests/CalculatorTest.php
```

## Ne pas modifier Docker sans demande

Le fichier suivant ne doit pas être modifié sauf demande explicite :

```text
docker-compose.yml
```

## Faire un commit après chaque test

Chaque test doit avoir son commit dédié.

Exemple :

```text
test01: create basic calculator project
test02: add subtract operation
test03: add multiply operation
...
test22: apply selected final review improvements
```

## Mettre à jour `rapport.log`

Chaque test doit ajouter une entrée dans :

```text
rapport.log
```

Ce fichier sert de journal complet pour la synthèse finale.

---

# 11. Fin de série : récupérer les informations

Après le test 22 :

```bash
git status
git log --oneline
cat rapport.log
docker compose run --rm php php tests/CalculatorTest.php
```

Le résultat attendu :

- working tree propre ;
- 22 commits de test, plus le commit d’initialisation ;
- `rapport.log` complet ;
- tests finaux verts.

---

# 12. Créer la synthèse finale par modèle

Utiliser le template :

```text
templates/result-summary-template.md
```

Créer un fichier dans :

```text
results/php-calculator-cli/
```

Nom recommandé :

```text
<agent>-<modele>.md
```

Exemples :

```text
results/php-calculator-cli/claude-code-deepseek-v4-flash.md
results/php-calculator-cli/claude-code-deepseek-v4-pro.md
results/php-calculator-cli/codex-gpt-5-5.md
results/php-calculator-cli/aider-qwen3-coder-480b-cloud.md
```

Pour cela, vous pouvez utiliser une IA propriétaire comme ChatGpt (5.5) ou Claude avec la procédure suivante

```
mkdir -p benchmark-final-report

cp rapport.log benchmark-final-report/rapport.log
git log --oneline --reverse > benchmark-final-report/git-log.txt
git status > benchmark-final-report/git-status.txt
docker compose run --rm php php tests/CalculatorTest.php > benchmark-final-report/final-tests.txt

tar -czf benchmark-final-report.tar.gz benchmark-final-report
```

Ensuite vous envoyez le fichier compressé à l'IA pour analyse:
benchmark-final-report.tar.gz

Vous pouvez aussi envoyer **le dossier complet** qui contiendra le code source.
La procédure pour cela :

```
cd ~/dev/bench-php-calculator-cli

mkdir -p benchmark-final-report

cp rapport.log benchmark-final-report/rapport.log
git log --oneline --reverse > benchmark-final-report/git-log.txt
git status > benchmark-final-report/git-status.txt
docker compose run --rm php php tests/CalculatorTest.php > benchmark-final-report/final-tests.txt

tar --exclude='.git' --exclude='vendor' --exclude='var/history.json' \
  -czf benchmark-final-report.tar.gz \
  benchmark-final-report \
  .
```


---

# 13. Exemple de structure finale du projet testé

À la fin de la série PHP, le projet cible pourra ressembler à ceci :

```text
bench-php-calculator-cli/
├── bin/
│   └── calculator.php
├── src/
│   ├── Calculator.php
│   ├── CalculatorCommand.php
│   └── HistoryRepository.php
├── tests/
│   └── CalculatorTest.php
├── var/
│   └── .gitkeep
├── composer.json
├── docker-compose.yml
├── README.md
├── rapport.log
└── .gitignore
```

---

# 16. Checklist rapide

Avant le test 1 :

```text
[ ] dépôt ai-agent-benchmarks cloné
[ ] dossier projet cible créé
[ ] git init exécuté dans le projet cible
[ ] docker-compose.yml minimal créé
[ ] docker compose run --rm php php -v fonctionne
[ ] rapport.log créé depuis le template
[ ] commit init benchmark workspace effectué
[ ] prompt d’initialisation envoyé à l’agent
[ ] agent prêt à recevoir le test 1
```

Après chaque test :

```text
[ ] tests lancés via Docker
[ ] rapport.log mis à jour
[ ] git diff --check exécuté
[ ] git add . exécuté
[ ] git commit effectué
[ ] hash du commit communiqué
[ ] git status propre
```

Après les 22 tests :

```text
[ ] rapport.log complet
[ ] git log --oneline récupéré
[ ] résultat final des tests récupéré
[ ] synthèse finale créée dans results/
```
