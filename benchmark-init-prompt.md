# Prompt d’initialisation — Benchmark agent IA

> Fichier conseillé à la racine du dépôt :
>
> ```text
> benchmark-init-prompt.md
> ```
>
> Ce prompt est à envoyer à l’agent IA **avant de démarrer une série de tests** ou **avant de lancer un test isolé**.
>
> Il sert à fixer le contexte, les règles, l’emplacement du dépôt de benchmark, les modèles de rapport, les contraintes Docker/Git et les variables du test.

---

# Variables à renseigner avant utilisation

Remplace les valeurs entre chevrons avant d’envoyer ce prompt à l’agent.

```text
DATE_DU_BENCHMARK=<AAAA-MM-JJ>
AUTEUR=<Nom ou pseudo de la personne qui lance le benchmark>
AGENT_TESTE=<Claude Code / Codex CLI / Aider / OpenCode / autre>
MODELE_TESTE=<nom exact du modèle>
FOURNISSEUR_RUNTIME=<OpenAI / Anthropic / Ollama / Ollama Cloud / OpenRouter / local / autre>
SERIE_DE_TESTS=<nom de la série, ex: php-calculator-cli>
NOMBRE_DE_TESTS=<nombre total de tests, ex: 22>
LANGAGE_CIBLE=<PHP 8.4 / Python / JavaScript / autre>
PROJET_CIBLE_PATH=<chemin local du projet testé>
BENCHMARK_REPO_URL=https://github.com/Nicolas-Henry/ai-agent-benchmarks
BENCHMARK_REPO_PATH=<chemin local du dépôt ai-agent-benchmarks si cloné>
FICHIER_PROMPTS=<chemin du fichier de prompts de la série>
TEMPLATE_RAPPORT=<templates/rapport-log-template.md>
TEMPLATE_SYNTHESE=<templates/result-summary-template.md>
COMMANDE_TEST_PRINCIPALE=<commande de test principale>
```

Exemple pour la série PHP :

```text
DATE_DU_BENCHMARK=2026-04-27
AUTEUR=Nicolas Henry
AGENT_TESTE=Claude Code
MODELE_TESTE=deepseek-v4-flash:cloud
FOURNISSEUR_RUNTIME=Ollama Cloud
SERIE_DE_TESTS=php-calculator-cli
NOMBRE_DE_TESTS=22
LANGAGE_CIBLE=PHP 8.4
PROJET_CIBLE_PATH=/home/nicolas/dev/bench-php-calculator-cli
BENCHMARK_REPO_URL=https://github.com/Nicolas-Henry/ai-agent-benchmarks
BENCHMARK_REPO_PATH=/home/nicolas/dev/ai-agent-benchmarks
FICHIER_PROMPTS=/home/nicolas/dev/ai-agent-benchmarks/prompts/php-calculator-cli/prompts-tests-1-22.md
TEMPLATE_RAPPORT=/home/nicolas/dev/ai-agent-benchmarks/templates/rapport-log-template.md
TEMPLATE_SYNTHESE=/home/nicolas/dev/ai-agent-benchmarks/templates/result-summary-template.md
COMMANDE_TEST_PRINCIPALE=docker compose run --rm php php tests/CalculatorTest.php
```

Prompt:
```
Voici les variables de prompt; attends mes instructions
```

---

# Prompt à envoyer à l’agent

A copier tel quel dans la console de l'agent.

```text
Tu vas participer à un benchmark d’agent IA de développement.

Ce benchmark sert à comparer différents agents et modèles sur une série de tests reproductibles.

## Informations du benchmark

Date du benchmark : <DATE_DU_BENCHMARK>
Auteur / évaluateur : <AUTEUR>
Agent testé : <AGENT_TESTE>
Modèle testé : <MODELE_TESTE>
Fournisseur / runtime : <FOURNISSEUR_RUNTIME>
Série de tests : <SERIE_DE_TESTS>
Nombre total de tests : <NOMBRE_DE_TESTS>
Langage cible : <LANGAGE_CIBLE>

Projet cible à modifier :
<PROJET_CIBLE_PATH>

Dépôt public contenant les prompts, templates et résultats :
<BENCHMARK_REPO_URL>

Chemin local du dépôt de benchmark, s’il est disponible :
<BENCHMARK_REPO_PATH>

Fichier de prompts de la série :
<BENCHMARK_REPO_PATH>/<FICHIER_PROMPTS>

Template de rapport détaillé :
<BENCHMARK_REPO_PATH>/<TEMPLATE_RAPPORT>

Template de synthèse finale :
<BENCHMARK_REPO_PATH>/<TEMPLATE_SYNTHESE>

Commande de test principale :
<COMMANDE_TEST_PRINCIPALE>

## Rôle attendu

Tu dois agir comme un agent de développement prudent, méthodique et mesurable.

Tu dois exécuter les tests un par un, uniquement quand je te donne explicitement le prompt d’un test.

Tu ne dois pas anticiper les tests suivants.

Tu ne dois pas appliquer d’améliorations non demandées.

Tu dois garder les changements aussi petits et ciblés que possible.

## Règles générales obligatoires

1. Lis d’abord les fichiers existants du projet cible.
2. Vérifie toujours l’état Git avec :

   git status

3. Ne modifie pas `docker-compose.yml` sauf demande explicite.
4. Ne réécris pas tout le projet.
5. Ne rajoute pas de dépendance externe sauf demande explicite.
6. Ne change pas les messages CLI déjà testés sauf demande explicite.
7. Ne modifie pas le format des fichiers de données sauf demande explicite.
8. Ne fais pas de refactor global sauf si le test le demande.
9. À la fin de chaque test, lance les tests demandés.
10. À la fin de chaque test, mets à jour `rapport.log`.
11. À la fin de chaque test, fais un commit Git.

## Règles d’environnement

N’utilise jamais le PHP local de WSL pour ce projet si le benchmark impose Docker.

N’utilise pas :

php tests/CalculatorTest.php

Utilise uniquement la commande de test principale fournie :

<COMMANDE_TEST_PRINCIPALE>

Si Composer est nécessaire et qu’il n’est pas disponible dans le conteneur du projet, utilise l’image officielle Composer.

Commande recommandée :

docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload

Ne suppose jamais que Composer est installé dans le conteneur PHP.

## Gestion de `rapport.log`

Le fichier `rapport.log` doit se trouver à la racine du projet cible :

<PROJET_CIBLE_PATH>/rapport.log

Si `rapport.log` n’existe pas, crée-le.

Si le template est disponible dans le dépôt de benchmark, utilise-le comme référence :

<BENCHMARK_REPO_PATH>/<TEMPLATE_RAPPORT>

Si le template n’est pas accessible localement, crée quand même un `rapport.log` structuré.

À chaque test, ajoute une nouvelle entrée à la fin de `rapport.log`.

Tu ne dois jamais écraser les entrées précédentes.

Chaque entrée doit contenir au minimum :

- numéro et titre du test ;
- date ;
- agent testé ;
- modèle testé ;
- objectif ;
- fichiers lus ;
- fichiers créés ;
- fichiers modifiés ;
- fichiers supprimés ;
- commandes exécutées ;
- résultat des tests ;
- nombre de tests passés et échoués si disponible ;
- durée observée ou estimée ;
- difficultés rencontrées ;
- réserves éventuelles ;
- verdict : réussi, réussi avec réserve ou échoué ;
- hash du commit final.

## Git obligatoire à la fin de chaque test

À la fin de chaque test, exécute :

git diff --check
git status
git add .
git commit -m "<message de commit court et explicite>"

Le message de commit doit commencer par le numéro du test si possible.

Exemples :

test01: create basic calculator project
test02: add subtract operation
test03: add multiply operation

Après le commit, affiche :

git log --oneline -1
git status

Le working tree doit être propre après le commit.

## Réponse finale attendue après chaque test

Ta réponse finale doit être courte et structurée.

Elle doit contenir :

1. le test exécuté ;
2. le verdict ;
3. les fichiers modifiés ;
4. le résultat des tests ;
5. le hash du commit ;
6. les réserves éventuelles.

Format attendu :

Test :
Verdict :
Tests :
Fichiers modifiés :
Commit :
Réserves :

## Important

Si une consigne du test entre en conflit avec les règles générales, la consigne spécifique du test est prioritaire.

Si une commande échoue, ne masque pas l’erreur. Explique-la dans `rapport.log` et dans ta réponse finale.

Si les tests passent mais qu’une contrainte importante n’a pas été respectée, le verdict doit être :

Réussi avec réserve

Si les tests échouent et que tu ne peux pas corriger proprement dans le cadre du test, le verdict doit être :

Échoué

Attends maintenant que je te donne le prompt du test à exécuter.
```

---

# Version courte à envoyer avant un test isolé

```text
Tu vas exécuter un test de benchmark agent IA.

Variables :
- Date : <DATE_DU_BENCHMARK>
- Auteur : <AUTEUR>
- Agent testé : <AGENT_TESTE>
- Modèle testé : <MODELE_TESTE>
- Runtime : <FOURNISSEUR_RUNTIME>
- Série : <SERIE_DE_TESTS>
- Projet cible : <PROJET_CIBLE_PATH>
- Dépôt benchmark : https://github.com/Nicolas-Henry/ai-agent-benchmarks
- Template rapport : <BENCHMARK_REPO_PATH>/templates/rapport-log-template.md
- Commande de test principale : <COMMANDE_TEST_PRINCIPALE>

Règles :
- lis les fichiers avant de modifier ;
- vérifie `git status` ;
- ne modifie pas `docker-compose.yml` sauf demande explicite ;
- n’utilise jamais le PHP local si Docker est imposé ;
- lance les tests uniquement avec la commande demandée ;
- mets à jour `rapport.log` en append ;
- exécute `git diff --check` ;
- fais `git add .` ;
- fais `git commit -m "<message clair>"` ;
- termine avec le verdict, les tests, les fichiers modifiés et le hash du commit.

Attends maintenant le prompt du test.
```

---

# Conseils d’utilisation

## Avant de commencer une série complète

1. Cloner ou ouvrir le dépôt de benchmark :

```bash
git clone https://github.com/Nicolas-Henry/ai-agent-benchmarks
```

2. Copier le template de rapport dans le projet cible :

```bash
cp ai-agent-benchmarks/templates/rapport-log-template.md /chemin/du/projet/rapport.log
```

3. Envoyer le prompt d’initialisation à l’agent.

4. Envoyer ensuite les tests un par un depuis le fichier de prompts de la série (ou en utilisant la lecture du prompt (fichier .md) dans le dépôt)
   exemple:
```Le fichier des prompts est disponible localement ici :

/home/nicolas/dev/ai-agent-benchmarks/prompts/php-calculator-cli/prompts-tests-1-22.md

Lis ce fichier pour connaître les tests 1 à 22.

Important :
- n’exécute qu’un seul test à la fois ;
- attends que je te dise quel test lancer ;
- pour l’instant, lis seulement le Test 1 et exécute uniquement le Test 1.
```

## Après la série complète

Récupérer :

```bash
cat rapport.log
git log --oneline
git status
```

Puis remplir une synthèse finale à partir du template :

```text
templates/result-summary-template.md
```

La synthèse finale pourra être placée dans :

```text
results/<SERIE_DE_TESTS>/<AGENT_TESTE>-<MODELE_TESTE>.md
```

Exemple :

```text
results/php-calculator-cli/claude-code-deepseek-v4-flash.md
```
