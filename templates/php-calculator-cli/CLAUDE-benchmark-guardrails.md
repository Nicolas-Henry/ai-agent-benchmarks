# Instructions permanentes — Benchmark agent IA

Tu travailles dans un benchmark d’agent IA de développement.

Le projet cible est une série de tests reproductibles nommée :

`php-calculator-cli`

## Règle principale

Tu dois exécuter uniquement le test explicitement fourni par l’utilisateur.

Tu ne dois jamais :

- inventer le test suivant ;
- déduire le contenu d’un test ;
- lancer plusieurs tests d’un coup ;
- continuer automatiquement après un test ;
- modifier le protocole ;
- remplacer la série officielle par tes propres idées.

Si le prompt complet du test n’est pas fourni, tu dois t’arrêter et répondre exactement :

```text
J’attends le prompt complet du test à exécuter.
```

## Chemins importants

Projet cible :

```text
/home/nicolas/dev/bench-php-calculator-cli
```

Dépôt benchmark :

```text
/home/nicolas/dev/ai-agent-benchmarks
```

Fichier complet des prompts :

```text
/home/nicolas/dev/ai-agent-benchmarks/prompts/php-calculator-cli/prompts-tests-1-22.md
```

Rapport :

```text
rapport.log
```

## Fichiers et dossiers

`PROJET_CIBLE_PATH` est un dossier, pas un fichier.

`BENCHMARK_REPO_PATH` est un dossier, pas un fichier.

Tu ne dois jamais essayer de lire un dossier comme un fichier.

Si tu dois inspecter un dossier, utilise un listage de répertoire, pas une lecture de fichier.

## Démarrage d’un test

Avant de modifier quoi que ce soit :

1. lis uniquement les fichiers nécessaires au test en cours ;
2. vérifie l’état Git avec :

```bash
git status
```

3. vérifie que tu es bien dans le projet cible ;
4. n’exécute que le test explicitement demandé.

Tu ne dois pas lire les 22 tests pour décider toi-même de la suite.

Tu ne dois pas anticiper le test suivant.

## Docker

N’utilise jamais le PHP local.

Commande interdite :

```bash
php tests/CalculatorTest.php
```

Commande obligatoire pour les tests :

```bash
docker compose run --rm php php tests/CalculatorTest.php
```

Si tu lances par erreur le PHP local, tu dois le signaler dans `rapport.log` et dans ta réponse finale.

## Composer

Ne suppose pas que Composer est installé dans le conteneur PHP.

Commande interdite si Composer n’est pas installé dans le conteneur :

```bash
docker compose run --rm php composer install
```

Si Composer est nécessaire, utilise l’image officielle Composer :

```bash
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer install
```

Pour régénérer l’autoload :

```bash
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
```

## Git

À la fin de chaque test, tu dois exécuter :

```bash
git diff --check
git status
git add .
git commit -m "testXX: message clair"
git log --oneline -1
git status
```

Le working tree doit être propre après chaque test.

Si le commit échoue, tu dois expliquer pourquoi dans `rapport.log`.

## Fichiers à ne jamais commiter

Ne jamais commiter :

```text
vendor/
var/history.json
var/test_*.json
benchmark-final-report/
```

Garder `var/.gitkeep` si le dossier `var/` doit exister.

Si un fichier généré apparaît dans Git, corrige `.gitignore` ou retire-le de l’index sans le supprimer du disque.

Exemple :

```bash
git rm --cached var/history.json
```

## rapport.log

À chaque test, ajoute une entrée à la fin de `rapport.log`.

Tu ne dois jamais effacer les entrées précédentes.

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

## Format recommandé pour une entrée de rapport

```text
================================================================================
Test XX — Titre du test
================================================================================

Date :
Agent :
Modèle :
Objectif :

Fichiers lus :
-

Fichiers créés :
-

Fichiers modifiés :
-

Fichiers supprimés :
-

Commandes exécutées :
-

Résultat des tests :
-

Nombre de tests passés :
Nombre de tests échoués :

Durée observée ou estimée :

Difficultés rencontrées :
-

Réserves :
-

Verdict :
[ ] Réussi
[ ] Réussi avec réserve
[ ] Échoué

Commit :
Hash :
Message :
```

## Réponse finale après chaque test

Après chaque test, réponds uniquement avec ce format :

```text
Test :
Verdict :
Tests :
Fichiers modifiés :
Commit :
Réserves :
```

Ne donne pas un long rapport dans le chat si `rapport.log` a déjà été mis à jour.

## Discipline

Si une consigne est ambiguë, ne devine pas.

Si tu ne sais pas quel test exécuter, demande le prompt complet.

Si les tests passent mais qu’une contrainte importante n’a pas été respectée, le verdict est :

```text
Réussi avec réserve
```

Si tu as modifié un fichier non demandé, signale-le.

Si tu as utilisé PHP local par erreur, signale-le.

Si tu as lancé une commande non demandée, signale-le.

## Interdictions importantes

Tu ne dois pas :

- exécuter plusieurs tests en une seule fois ;
- créer des tests supplémentaires hors prompt ;
- ajouter de nouvelles fonctionnalités non demandées ;
- modifier `docker-compose.yml` sauf demande explicite ;
- ajouter une dépendance externe sauf demande explicite ;
- modifier les messages CLI déjà testés sauf demande explicite ;
- changer le format de `var/history.json` sauf demande explicite ;
- commiter `vendor/` ;
- commiter `var/history.json` ;
- supprimer `rapport.log`.

## Objectif du benchmark

La priorité n’est pas de produire le plus de code possible.

La priorité est de respecter strictement le protocole du benchmark.

Un bon résultat est un résultat :

- conforme au prompt ;
- minimal ;
- testé ;
- documenté ;
- commité proprement ;
- traçable dans `rapport.log`.

## En cas de problème

Si une commande échoue :

1. ne masque pas l’erreur ;
2. explique la cause probable ;
3. corrige uniquement si cela fait partie du test ;
4. indique la réserve dans `rapport.log`.

Si tu ne peux pas terminer proprement le test, le verdict doit être :

```text
Échoué
```

ou :

```text
Réussi avec réserve
```

selon le cas.

## À retenir

Exécute uniquement le test fourni.

Respecte Docker.

Respecte Git.

Mets à jour `rapport.log`.

Ne devine jamais la suite.
