# Résultat benchmark — Claude Code + `deepseek-v4-flash:cloud`

## Informations générales

| Champ | Valeur |
|---|---|
| Série de benchmark | `php-calculator-cli` |
| Date du test | 2026-04-27 |
| Agent utilisé | Claude Code |
| Modèle utilisé | `deepseek-v4-flash:cloud` |
| Fournisseur / runtime | Ollama Cloud |
| Langage cible | PHP 8.4 |
| Environnement | WSL2 / Debian + Docker |
| Commande de test principale | `docker compose run --rm php php tests/CalculatorTest.php` |
| Nombre de tests dans la série | 22 |
| Nombre final de tests automatisés | 44 PASS |
| Commits de tests | 22 commits de test + 1 commit d’initialisation |

---

# Résumé exécutif

Le benchmark complet de 22 tests a été terminé avec succès avec **Claude Code + `deepseek-v4-flash:cloud`**.

Le modèle a réussi toute la série : création du projet PHP, ajout progressif de fonctionnalités, CLI, validation des arguments, correction de bug volontaire, historique JSON, refactors d’architecture, Composer/autoload PSR-4, gestion de `vendor/`, robustesse sur JSON corrompu, commande `clear-history`, limite d’historique, revue finale et application sélective des recommandations.

Le résultat final indique **44 tests automatisés PASS** dans `tests/CalculatorTest.php`.

Le projet final est propre architecturalement pour son périmètre :

- `App\Calculator` : opérations mathématiques ;
- `App\CalculatorCommand` : orchestration CLI ;
- `App\HistoryRepository` : persistance et affichage de l’historique JSON ;
- Composer PSR-4 configuré ;
- `vendor/` non versionné ;
- historique limité à 50 entrées par défaut et configurable.

---

# Verdict global

```text
Verdict : très bon résultat sur cette série PHP agentique.
```

Le modèle est très efficace sur les tâches incrémentales, les refactors raisonnables et les tests.  
Il reste quelques points à surveiller pour une publication ou une comparaison stricte : le rapport a été rempli en ordre chronologique inverse, les hash de commits ne sont pas renseignés dans chaque entrée du `rapport.log`, et le `git-status.txt` final indique des fichiers de rapport générés non suivis au moment de la capture.

---

# Score global proposé

| Catégorie | Note /5 | Commentaire |
|---|---:|---|
| Génération de code | 4.5 | Code simple, lisible et adapté au périmètre. |
| Respect des consignes | 4.5 | Très bon respect global. Quelques écarts mineurs de reporting. |
| Usage Docker | 5 | Les tests finaux et les entrées du rapport utilisent Docker. |
| Tests | 4.5 | Bonne couverture progressive, 44 PASS finaux. |
| Refactorisation | 4.5 | Extraction réussie de `HistoryRepository` puis `CalculatorCommand`. |
| Architecture | 4.5 | Séparation claire des responsabilités. |
| Documentation | 4 | README complet et utilisable. |
| Git / commits | 4 | 22 commits de test + init. Rapport final non commité au moment de la capture. |
| Mise à jour `rapport.log` | 3.5 | Complet, mais inversé et sans hash de commit dans les entrées. |
| Robustesse | 4.5 | JSON absent/vide/corrompu, clear, limite configurable. |
| Autonomie | 4.5 | Très bonne capacité à suivre la série jusqu’au bout. |
| Vitesse | 4 | Durées rapportées généralement entre 1 et 3 minutes par test. |

## Note globale proposée

```text
4.4 / 5
```

---

# Tableau récapitulatif des 22 tests

| N° | Test | Résultat | Tests automatisés | Durée |
|---:|---|---|---|---|
| 1 | Création d'une base PHP simple | Réussi | All Calculator tests passed! | ~2 minutes |
| 2 | Ajouter subtract() | Réussi | All Calculator tests passed! | ~1 minute |
| 3 | Ajouter multiply() | Réussi | All Calculator tests passed! | ~1 minute |
| 4 | Ajouter divide() avec exception | Réussi | All Calculator tests passed! | ~1 minute |
| 5 | Refactor des tests | Réussi | All Calculator tests passed! (16 PASS) | ~1 minute |
| 6 | Ajouter une mini CLI | Réussi | All Calculator tests passed! + All CLI tests passed! (22 tests) | ~2 minutes |
| 7 | Robustesse CLI : validation des arguments | Réussi | 26 tests PASS (16 Calculator + 10 CLI) | ~1 minute |
| 8 | Documentation uniquement | Réussi | 26 tests PASS (non-régression) | ~1 minute |
| 9 | Bugfix volontaire sur divide() | Réussi | 26 tests PASS après correction (1 échec intermédiaire sur divide(5,2): expected 2.5, got 2.0) | ~1 minute |
| 10 | Historique JSON des opérations CLI | Réussi | 28 tests PASS (16 Calculator + 12 CLI) | ~2 minutes |
| 11 | Refactor architecture de l'historique | Réussi | 28 tests PASS (non-régression) | ~2 minutes |
| 12 | Correction documentation/tests après revue | Réussi | 29 tests PASS (1 nouveau test ISO 8601) | ~1 minute |
| 13 | Revue de code sans modification | Réussi | 29 tests PASS | ~2 minutes |
| 14 | Application sélective de la revue | Réussi | 31 tests PASS (2 nouveaux) | ~3 minutes |
| 15 | Composer / autoload PSR-4 | Réussi | 31 tests PASS (non-régression) | ~2 minutes |
| 16 | Reproductibilité Composer / vendor / .gitignore | Réussi | 31 tests PASS (non-régression) | ~1 minute |
| 17 | Robustesse de history.json vide ou corrompu | Réussi | 36 tests PASS (5 nouveaux tests de robustesse) | ~2 minutes |
| 18 | Ajouter clear-history | Réussi | 42 tests PASS (3 nouveaux tests clear-history) | ~2 minutes |
| 19 | Refactor CLI vers une classe dédiée | Réussi | 42 tests PASS (non-régression) | ~3 minutes |
| 20 | Limiter l'historique à 50 entrées | Réussi | 43 tests PASS (1 nouveau test limite) | ~2 minutes |
| 21 | Revue finale complète sans modification | Réussi | 43 tests PASS | ~3 minutes |
| 22 | Application sélective de la revue finale | Réussi | 44 tests PASS (1 nouveau test configurable max) | ~2 minutes |

---

# Statistiques finales

| Métrique | Valeur |
|---|---:|
| Tests de benchmark terminés | 22 / 22 |
| Tests réussis | 22 |
| Tests réussis avec réserve | 0 dans `rapport.log` |
| Tests échoués | 0 |
| Tests automatisés finaux | 44 PASS |
| Commits de test | 22 |
| Commit d’initialisation | 1 |
| Working tree au moment de `git-status.txt` | Pas totalement propre : fichiers de rapport générés non suivis |
| `vendor/` versionné | Non |
| `var/history.json` versionné | Non |
| Composer autoload | PSR-4 `App\` → `src/` |

---

# Analyse du code final

## Architecture

Le projet final possède une architecture claire et adaptée :

```text
src/
├── Calculator.php
├── CalculatorCommand.php
└── HistoryRepository.php
```

### `Calculator`

Classe simple et centrée sur les opérations :

- `add()`
- `subtract()`
- `multiply()`
- `divide()`

La division par zéro lève bien une `InvalidArgumentException`.

### `CalculatorCommand`

La logique CLI est sortie de `bin/calculator.php`, ce qui est un bon refactor.

Elle gère :

- routage des commandes ;
- validation des arguments ;
- messages d’erreur ;
- appel au repository d’historique ;
- commande `history` ;
- commande `clear-history`.

### `HistoryRepository`

La classe gère :

- lecture de l’historique ;
- écriture JSON ;
- création du dossier si nécessaire ;
- verrouillage fichier avec `flock()` ;
- récupération si fichier absent, vide ou corrompu ;
- limite à 50 entrées par défaut ;
- limite configurable via constructeur ;
- vidage de l’historique.

---

# Points forts observés

## 1. Série complète terminée

Les 22 tests sont présents dans le rapport et les 22 commits de test sont présents dans le log Git.

## 2. Progression cohérente

L’évolution du projet est logique :

1. base PHP ;
2. opérations ;
3. CLI ;
4. robustesse CLI ;
5. documentation ;
6. bugfix ;
7. historique JSON ;
8. refactors ;
9. Composer ;
10. robustesse JSON ;
11. revue finale ;
12. application sélective.

## 3. Bonne qualité des tests

La suite finale couvre :

- opérations mathématiques ;
- exceptions ;
- CLI ;
- arguments invalides ;
- commandes inconnues ;
- historique ;
- fichiers JSON corrompus ;
- `clear-history` ;
- limite d’historique ;
- limite configurable.

## 4. Bonne gestion Composer / Git

Le projet final contient :

```text
composer.json
.gitignore
```

avec :

```text
vendor/
var/history.json
var/test_*
```

`vendor/` n’est pas inclus dans l’archive finale, ce qui est conforme à la bonne pratique.

## 5. Documentation exploitable

Le README explique :

- prérequis ;
- structure ;
- autoload Composer ;
- lancement des tests ;
- usage CLI ;
- erreurs possibles ;
- historique limité à 50 entrées.

---

# Limites et réserves

## 1. `rapport.log` en ordre inverse

Le rapport contient bien les 22 tests, mais l’ordre est inversé : il commence par le test 22 et finit par le test 1.

Ce n’est pas bloquant, mais pour une publication, un ordre chronologique 1 → 22 serait plus lisible.

## 2. Hash de commit absent dans les entrées du rapport

Chaque entrée contient une section `Commit :`, mais le hash n’est pas renseigné dans `rapport.log`.

Heureusement, `git-log.txt` permet de retrouver les commits.

## 3. Working tree pas totalement propre dans la capture finale

Le fichier `git-status.txt` indique :

```text
Untracked files:
  benchmark-final-report/
  final-tests.txt
  git-log.txt
```

Ce sont des fichiers générés pour la collecte finale. Ce n’est pas une erreur du code source, mais il faut le signaler dans le résultat publié.

## 4. Nombre final : 44 PASS, pas 45

Dans l’archive analysée, `final-tests.txt` contient **44 lignes PASS**.

Le rapport du test 22 mentionne également **44 tests PASS**. Si une sortie précédente indiquait 45/45, elle ne correspond pas à cette archive finale.

## 5. `.claude/settings.local.json` présent dans l’archive

Le fichier est présent dans l’archive. Son contenu n’est pas sensible ici, mais pour un dépôt public ou un résultat publié, il peut être préférable de ne pas versionner les fichiers locaux propres à l’outil.

---

# Recommandations avant publication du résultat

## 1. Nettoyer les fichiers de collecte finale

Dans le projet testé, les fichiers suivants peuvent rester hors Git ou être déplacés dans `results/` :

```text
benchmark-final-report/
final-tests.txt
git-log.txt
```

## 2. Compléter ou générer automatiquement les hashes dans `rapport.log`

Exemple :

```text
Commit :
Hash : c81a667
Message : test22: apply selected final review improvements
```

## 3. Publier cette synthèse dans le dépôt benchmark

Chemin recommandé :

```text
results/php-calculator-cli/claude-code-deepseek-v4-flash.md
```

## 4. Ajouter éventuellement `.claude/` dans `.gitignore`

À envisager si les futurs benchmarks ne doivent pas versionner les fichiers locaux d’agent :

```gitignore
.claude/
```

---

# Git log analysé

```text
a818ac5 init benchmark workspace
54b4341 test01: create basic calculator project
8e60816 test02: add subtract operation
2df299c test03: add multiply operation
b3c01e7 test04: add divide operation
0ea4037 test05: refactor calculator tests
c6a819d test06: add calculator cli
1d29bde test07: validate cli arguments
1085b1b test08: improve documentation
09df1a2 test09: fix divide bug
955b0c7 test10: add json history
848b4ea test11: extract history repository
bede95c test12: improve history docs and tests
560e66c test13: review codebase
3b22411 test14: apply selected review improvements
4d3ca44 test15: add composer autoload
b23d910 test16: fix composer vendor workflow
3b4eecd test17: harden history json handling
70e2783 test18: add clear history command
dee77b6 test19: move cli logic to command class
0cfe4e7 test20: limit history to last 50 entries
106cd93 test21: final code review
c81a667 test22: apply selected final review improvements
```

---

# Résultat final des tests

```text
PASS [add(1, 2)]
PASS [add(-1, 1)]
PASS [add(0, 0)]
PASS [add(-5, -3)]
PASS [subtract(5, 3)]
PASS [subtract(1, 5)]
PASS [subtract(0, 0)]
PASS [subtract(-5, -3)]
PASS [multiply(2, 3)]
PASS [multiply(0, 5)]
PASS [multiply(-4, 3)]
PASS [multiply(-4, -3)]
PASS [divide(6, 3)]
PASS [divide(5, 2)]
PASS [divide(-10, 2)]
PASS [divide(1, 0) throws]

All Calculator tests passed!
PASS [cli add 1 2]
PASS [cli subtract 5 3]
PASS [cli multiply 2 3]
PASS [cli divide 6 3]
PASS [cli divide by zero]
PASS [cli unknown command]
PASS [cli add missing args]
PASS [cli add missing second arg]
PASS [cli add invalid a]
PASS [cli add invalid b]
PASS [HistoryRepository save and getAll]
PASS [history robustness no file]
PASS [history robustness empty file]
PASS [history robustness invalid json]
PASS [history robustness object not array]
PASS [history robustness recovery after corruption]
PASS [HistoryRepository clear]
PASS [history max entries limit]
PASS [history configurable max entries]
PASS [cli history empty]
PASS [cli history after operation]
PASS [cli history iso 8601 format]
PASS [cli history with extra params]
PASS [cli history corrupted json]
PASS [cli history recovery after corruption]
PASS [cli clear-history]
PASS [cli clear-history after add]
PASS [cli history after clear]
All CLI tests passed!
```

---

# Conclusion

Cette exécution de la série `php-calculator-cli` avec **Claude Code + `deepseek-v4-flash:cloud`** est une réussite.

Le modèle a terminé les **22 tests sur 22**, produit un projet final fonctionnel, documenté, testé et correctement structuré.

Le résultat est suffisamment bon pour être publié comme premier benchmark de référence dans le dépôt `ai-agent-benchmarks`.

Verdict final :

```text
Très bon agent build sur petit projet PHP, avec supervision humaine légère recommandée pour le reporting, Git et les fichiers locaux d’outil.
```
