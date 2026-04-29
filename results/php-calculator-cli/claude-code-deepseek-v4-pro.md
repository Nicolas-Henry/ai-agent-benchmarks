# Résultat benchmark — Claude Code + `deepseek-v4-pro:cloud`

## Informations générales

| Champ | Valeur |
|---|---|
| Série de benchmark | `php-calculator-cli` |
| Série de prompts | `tests-1-22` |
| Date de début | 2026-04-28 |
| Agent utilisé | Claude Code |
| Modèle utilisé | `deepseek-v4-pro:cloud` |
| Fournisseur / runtime | Ollama Cloud |
| Langage cible | PHP 8.4 |
| Environnement | Windows 11 + WSL2 Debian |
| OS | Linux 5.15.153.1-microsoft-standard-WSL2 |
| Docker | Docker version 28.5.2 |
| Commande de test principale | `docker compose run --rm php php tests/CalculatorTest.php` |
| Nombre de tests dans la série | 22 |
| Nombre final de tests automatisés | 110 passed / 0 failed |
| Commits de test | 43 commits de test |
| Commits correctifs de rapport | 20 commits |
| Commit d’initialisation | 1 commit |

---

# Résumé exécutif

Le benchmark complet **`php-calculator-cli`** a été terminé avec succès avec **Claude Code + `deepseek-v4-pro:cloud`**.

Les **22 tests sur 22** sont présents dans `rapport.log`, avec un historique Git complet et des commits associés.  
Le résultat final de la suite automatisée est :

```text
Results: 110 passed, 0 failed
```

Le modèle a réussi à construire progressivement un mini projet PHP 8.4 complet :

- création d’une base PHP sans framework ;
- ajout progressif des opérations mathématiques ;
- création d’une CLI ;
- validation des arguments ;
- correction d’un bug volontaire ;
- historique JSON ;
- refactor vers `HistoryRepository` ;
- Composer / autoload PSR-4 ;
- gestion de `vendor/` et `.gitignore` ;
- robustesse face aux fichiers JSON vides ou corrompus ;
- commande `clear-history` ;
- refactor CLI vers `CalculatorCommand` ;
- limite d’historique à 50 entrées ;
- revue finale ;
- application sélective des recommandations.

---

# Verdict global

```text
Verdict : excellent résultat sur cette série PHP agentique.
```

Le modèle s’est montré très fiable sur cette série. Il a produit un projet final fonctionnel, testé, structuré, documenté et maintenable pour le périmètre du benchmark.

Le résultat est supérieur au précédent rapport Flash sur un point important : le projet final contient une suite de tests beaucoup plus complète, avec **110 assertions PASS** dans l’archive fournie.

---

# Score global proposé

| Catégorie | Note /5 | Commentaire |
|---|---:|---|
| Génération de code | 4.6 | Code simple, lisible, cohérent avec le périmètre. |
| Qualité du code | 4.4 | Bonne structure finale, responsabilités séparées, dette faible. |
| Respect des consignes | 4.5 | Très bon respect global, y compris Docker et Git. |
| Usage Docker | 5 | Les tests finaux et le rapport utilisent Docker. |
| Tests | 4.8 | Couverture finale très complète : 110 tests passés. |
| Refactorisation | 4.6 | Refactors réussis vers `HistoryRepository` et `CalculatorCommand`. |
| Architecture | 4.5 | Architecture claire et adaptée à une petite CLI PHP. |
| Documentation | 4.2 | README complet, clair et cohérent avec le projet final. |
| Git / commits | 4.2 | Commits par test présents, mais avec commits additionnels pour corriger les hashes du rapport. |
| Mise à jour `rapport.log` | 4.2 | Rapport complet, chronologique et avec hashes, mais nécessité de commits correctifs. |
| Robustesse | 4.7 | Très bonne gestion des cas limites JSON, CLI et historique. |
| Autonomie | 4.6 | Très bonne capacité à enchaîner les 22 tests. |
| Vitesse | 4 | Durées rapportées généralement courtes, autour de 1 à 3 minutes par test. |

## Note globale proposée

```text
4.6 / 5
```

---

# Tableau récapitulatif des 22 tests

| N° | Test | Résultat | Tests automatisés | Durée | Commit |
|---:|---|---|---:|---:|---|
| 1 | Création d'une base PHP simple | Réussi | 4 pass / 0 fail | 2 min | `64c7a3e` |
| 2 | Ajouter subtract() | Réussi | 8 pass / 0 fail | 1 min | `7dbaf8e` |
| 3 | Ajouter multiply() | Réussi | 12 pass / 0 fail | 1 min | `42cc204` |
| 4 | Ajouter divide() avec exception | Réussi | 16 pass / 0 fail | 1 min | `f15fe87` |
| 5 | Refactor des tests | Réussi | 16 pass / 0 fail | 1 min | `1b6569f` |
| 6 | Ajouter une mini CLI | Réussi | 30 pass / 0 fail | 1 min | `bcaf876` |
| 7 | Robustesse CLI : validation des arguments | Réussi | 42 pass / 0 fail | 1 min | `62d3f3b` |
| 8 | Documentation uniquement | Réussi | 42 pass / 0 fail | 1 min | `e9a032a` |
| 9 | Bugfix volontaire sur divide() | Réussi | 42 pass / 0 fail | 1 min | `0da6d48` |
| 10 | Historique JSON des opérations CLI | Réussi | 58 pass / 0 fail | 2 min | `08178db` |
| 11 | Refactor architecture de l'historique | Réussi | 58 pass / 0 fail | 1 min | `1648d1f` |
| 12 | Correction documentation/tests après revue | Réussi | 58 pass / 0 fail | 1 min | `362d9d4` |
| 13 | Revue de code sans modification | Réussi |  pass /  fail | 2 min | `78f0bbe` |
| 14 | Application sélective de la revue | Réussi | 67 pass / 0 fail | 2 min | `320a311` |
| 15 | Composer / autoload PSR-4 | Réussi | 67 pass / 0 fail | 2 min | `e4f2894` |
| 16 | Reproductibilité Composer / vendor / .gitignore | Réussi | 67 pass / 0 fail | 2 min | `f5a2351` |
| 17 | Robustesse de history.json vide ou corrompu | Réussi | 84 pass / 0 fail | 2 min | `f8557dd` |
| 18 | Ajouter clear-history | Réussi | 93 pass / 0 fail | 1 min | `3455ce6` |
| 19 | Refactor CLI vers une classe dédiée | Réussi | 93 pass / 0 fail | 1 min | `6b73408` |
| 20 | Limiter l’historique à 50 entrées | Réussi | 105 pass / 0 fail | 1 min | `be3cbfa` |
| 21 | Revue finale complète sans modification | Réussi |  pass /  fail | 3 min | `40ad398` |
| 22 | Application sélective de la revue finale | Réussi | 110 pass / 0 fail | 2 min | `62c76b9` |

---

# Statistiques finales

| Métrique | Valeur |
|---|---:|
| Tests de benchmark terminés | 22 / 22 |
| Tests réussis | 22 |
| Tests réussis avec réserve | 0 |
| Tests échoués | 0 |
| Tests automatisés finaux | 110 passed / 0 failed |
| Commits de test | 43 |
| Commits correctifs de rapport | 20 |
| Total commits | 44 |
| `vendor/` versionné | Non |
| `var/history.json` versionné | Non |
| Composer autoload | PSR-4 `App\` → `src/` |

---

# Analyse du code final

## Architecture

Le projet final possède une architecture simple et claire :

```text
src/
├── Calculator.php
├── CalculatorCommand.php
└── HistoryRepository.php
```

## `Calculator`

La classe `Calculator` est centrée sur les opérations mathématiques :

- `add()`
- `subtract()`
- `multiply()`
- `divide()`

Elle ne connaît ni la CLI, ni l’historique, ni le stockage.  
La division par zéro est correctement gérée avec une `InvalidArgumentException`.

## `CalculatorCommand`

La classe `CalculatorCommand` orchestre la CLI :

- dispatch des commandes ;
- validation des arguments ;
- affichage de l’aide ;
- exécution des opérations ;
- capture des erreurs métier ;
- commande `history` ;
- commande `clear-history`.

Le point d’entrée `bin/calculator.php` est propre : il charge l’autoload, instancie les dépendances et délègue l’exécution à `CalculatorCommand`.

## `HistoryRepository`

La classe `HistoryRepository` gère la persistance JSON :

- lecture de l’historique ;
- écriture JSON ;
- création du dossier si nécessaire ;
- verrouillage avec `flock()` ;
- récupération si fichier absent, vide ou corrompu ;
- commande de vidage ;
- limite de 50 entrées ;
- limite configurable via constructeur.

---

# Qualité du code généré

## Appréciation globale

La qualité du code généré est **bonne à très bonne** pour le périmètre du benchmark.

Le modèle produit un code lisible, progressif et globalement maintenable. Le projet n’est pas sur-complexifié : il reste volontairement simple, sans framework et sans dépendance externe inutile.

L’évolution de l’architecture est cohérente : l’agent commence par une classe simple, puis extrait progressivement les responsabilités quand les fonctionnalités le justifient.

## Points positifs

- Code PHP clair et compréhensible.
- Responsabilités bien séparées entre calcul, CLI et historique.
- Point d’entrée CLI léger.
- Pas de dépendance externe inutile.
- Composer utilisé uniquement pour l’autoload.
- Gestion robuste des erreurs principales.
- Bonne résistance aux fichiers JSON invalides.
- Tests nombreux et progressifs.
- README cohérent avec l’état final du projet.
- Usage de PHP moderne (`match`, types, `array_is_list`, union type `float|int`).

## Points perfectibles

- Le mini-framework de tests maison devient volumineux avec 110 assertions.
- Les tests CLI utilisent des sous-processus, ce qui reste acceptable ici mais pourrait devenir lent.
- `HistoryRepository::getAll()` utilise `file_get_contents()` sans verrou de lecture explicite dans cette version finale, alors que le benchmark avait demandé une réflexion autour de `flock()`. L’écriture est correctement verrouillée via `save()`, mais une lecture verrouillée serait plus stricte.
- Le format d’historique reste un tableau associatif simple, sans objet métier dédié.
- La validation des entrées historiques reste structurelle mais pas fortement typée champ par champ.
- `CalculatorCommand` est propre mais pourrait grossir si d’autres commandes sont ajoutées.

## Évaluation qualité du code

| Critère | Note | Commentaire |
|---|---:|---|
| Lisibilité | 4.5/5 | Code clair et facile à lire. |
| Simplicité | 4.5/5 | Solution pragmatique, sans sur-ingénierie. |
| Architecture | 4.5/5 | Responsabilités bien séparées. |
| Maintenabilité | 4.2/5 | Bonne base, mais tests et CLI pourraient être modularisés si le projet grossit. |
| Robustesse | 4.6/5 | Très bons cas limites couverts. |
| Style PHP | 4.3/5 | Style moderne et cohérent avec PHP 8.4. |
| Dette technique | 4.1/5 | Dette faible pour un mini projet, quelques limites assumées. |

## Verdict qualité du code

Le code final est **propre, exploitable et bien adapté au benchmark**.

Il ne s’agit pas seulement d’un code qui “fait passer les tests” : l’architecture s’améliore au fil des prompts et le résultat final est suffisamment clair pour servir de référence comparative avec d’autres modèles.

---

# Points forts observés

## 1. Très bonne complétion de la série

Les 22 tests ont été exécutés et documentés.

## 2. Suite de tests finale très riche

Le projet final atteint :

```text
110 passed, 0 failed
```

C’est un bon signal de non-régression et de couverture fonctionnelle.

## 3. Rapport mieux structuré que la première exécution

Cette archive contient :

- les 22 entrées dans l’ordre chronologique ;
- les hashes de commits renseignés ;
- un log Git complet.

## 4. Bonne discipline Git

Chaque test dispose d’un commit principal, avec parfois un commit correctif pour compléter le hash dans `rapport.log`.

## 5. Bonne architecture finale

Le découpage `Calculator` / `CalculatorCommand` / `HistoryRepository` est pertinent et lisible.

---

# Limites et réserves

## 1. Commits correctifs de rapport nombreux

Le log Git contient de nombreux commits du type :

```text
fix commit hash in rapport.log
```

Cela améliore le rapport final, mais alourdit l’historique Git.

Pour un futur benchmark, il serait préférable que l’agent renseigne le hash directement après le commit, ou qu’il utilise une procédure en deux étapes plus propre.

## 2. Working tree pas totalement propre dans la capture finale

Le fichier `git-status.txt` indique :

```text
Untracked files:
  benchmark-final-report/
```

Ce n’est pas une erreur du projet, mais un dossier de collecte finale non suivi.  
Pour publication, il faut simplement ne pas l’inclure dans le projet testé ou le déplacer dans le dépôt de benchmark.

## 3. `.claude/settings.local.json` présent dans l’archive

Ce fichier n’est pas problématique ici, mais pour un dépôt public il vaut mieux éviter d’archiver ou publier les fichiers locaux propres à l’outil.

## 4. Lecture de l’historique perfectible

L’écriture est verrouillée via `flock()`, mais la lecture finale repose sur `file_get_contents()`.

Pour un mini projet, c’est acceptable. Pour un usage plus strict, une lecture avec verrou partagé serait préférable.

---

# Recommandations avant publication du résultat

## 1. Publier ce rapport dans le dépôt benchmark

Chemin recommandé :

```text
results/php-calculator-cli/claude-code-deepseek-v4-pro.md
```

## 2. Ne pas publier l’archive complète du projet testé

Éviter notamment :

```text
.claude/
benchmark-final-report/
vendor/
var/history.json
```

## 3. Ajouter une note de comparaison Flash vs Pro

Ce résultat peut être comparé au rapport :

```text
results/php-calculator-cli/claude-code-deepseek-v4-flash.md
```

Différence notable :

- Flash : rapport précédent avec 44 PASS finaux dans l’archive analysée.
- Pro : rapport actuel avec 110 PASS finaux dans l’archive analysée.

## 4. Simplifier la procédure de hash de commit

Pour les prochaines séries, prévoir une consigne du type :

```bash
git commit -m "..."
COMMIT_HASH=$(git log --oneline -1 --format=%h)
# puis mise à jour du rapport si nécessaire
```

ou accepter que le hash soit absent du rapport et récupéré depuis `git-log.txt`.

---

# Git log analysé

```text
9e92496 init benchmark workspace
64c7a3e test01: create basic calculator project
7dbaf8e test02: add subtract operation
c7978a1 test02: update rapport.log with commit hash
42cc204 test03: add multiply operation
7ec0576 test03: fix commit hash in rapport.log
f15fe87 test04: add divide operation
0d43fee test04: fix commit hash in rapport.log
1b6569f test05: refactor calculator tests
f49c847 test05: fix commit hash in rapport.log
bcaf876 test06: add calculator cli
20f9adf test06: fix commit hash in rapport.log
62d3f3b test07: validate cli arguments
a2ba812 test07: fix commit hash in rapport.log
e9a032a test08: improve documentation
a0045a3 test08: fix commit hash in rapport.log
0da6d48 test09: fix divide bug
785d100 test09: fix commit hash in rapport.log
08178db test10: add json history
d8e8128 test10: fix commit hash in rapport.log
1648d1f test11: extract history repository
c0641b7 test11: fix commit hash in rapport.log
362d9d4 test12: improve history docs and tests
ae06f24 test12: fix commit hash in rapport.log
78f0bbe test13: review codebase
4d19174 test13: fix commit hash in rapport.log
320a311 test14: apply selected review improvements
97565fe test14: fix commit hash in rapport.log
e4f2894 test15: add composer autoload
653b110 test15: fix commit hash in rapport.log
f5a2351 test16: fix composer vendor workflow
3596627 test16: fix commit hash in rapport.log
f8557dd test17: harden history json handling
5471c32 test17: fix commit hash in rapport.log
3455ce6 test18: add clear history command
6ec2506 test18: fix commit hash in rapport.log
6b73408 test19: move cli logic to command class
4b2231e fix: update test19 commit hash in rapport.log
be3cbfa test20: limit history to last 50 entries
0ec73f9 fix: update test20 commit hash in rapport.log
40ad398 test21: final code review
5b24064 fix: update test21 commit hash in rapport.log
62c76b9 test22: apply selected final review improvements
beb3401 fix: update test22 commit hash in rapport.log
```

---

# Résultat final des tests

```text
Calculator Tests
================

add()
  ✓ 1 + 1 = 2
  ✓ 0 + 0 = 0
  ✓ -1 + 1 = 0
  ✓ 100 + 200 = 300

subtract()
  ✓ 5 - 3 = 2
  ✓ 0 - 0 = 0
  ✓ -1 - 1 = -2
  ✓ 10 - 20 = -10

multiply()
  ✓ 2 * 3 = 6
  ✓ 0 * 5 = 0
  ✓ -4 * 3 = -12
  ✓ -4 * -3 = 12

divide()
  ✓ 6 / 3 = 2.0
  ✓ 5 / 2 = 2.5
  ✓ -10 / 2 = -5.0

divide() by zero
  ✓ throws InvalidArgumentException with correct message

CLI
---
  ✓ cli add 1 2 exit code
  ✓ cli add 1 2 output
  ✓ cli subtract 5 3 exit code
  ✓ cli subtract 5 3 output
  ✓ cli multiply 2 3 exit code
  ✓ cli multiply 2 3 output
  ✓ cli divide 6 3 exit code
  ✓ cli divide 6 3 output
  ✓ cli divide by zero exit code
  ✓ cli divide by zero output
  ✓ cli no args exit code
  ✓ cli no args shows usage
  ✓ cli unknown command exit code
  ✓ cli unknown command shows usage

CLI validation
-------------
  ✓ cli add missing arg exit code
  ✓ cli add missing arg shows usage
  ✓ cli subtract missing arg exit code
  ✓ cli subtract missing arg shows usage
  ✓ cli add invalid a exit code
  ✓ cli add invalid a output
  ✓ cli add invalid b exit code
  ✓ cli add invalid b output
  ✓ cli add float a exit code
  ✓ cli add float a output
  ✓ cli add non-numeric a exit code
  ✓ cli add non-numeric a output

History
-------
  ✓ history after add: exit code
  ✓ history file created
  ✓ history is array
  ✓ history has 1 entry
  ✓ entry operation
  ✓ entry a
  ✓ entry b
  ✓ entry result
  ✓ entry has created_at
  ✓ created_at is ISO 8601
  ✓ history has 2 entries
  ✓ history command exit code
  ✓ history contains add entry
  ✓ history contains multiply entry
  ✓ history empty exit code
  ✓ history empty output

HistoryRepository unit
----------------------
  ✓ repo getAll empty returns array
  ✓ repo getAll empty has 0 entries
  ✓ repo after append has 1 entry
  ✓ repo entry operation
  ✓ repo entry a
  ✓ repo entry b
  ✓ repo entry result
  ✓ repo entry has created_at
  ✓ repo has 2 entries

History robustness
------------------
  ✓ absent file exit code
  ✓ absent file output
  ✓ empty file exit code
  ✓ empty file output
  ✓ invalid json exit code
  ✓ invalid json output
  ✓ json object exit code
  ✓ json object output
  ✓ recovery after corruption exit code
  ✓ recovery after corruption output
  ✓ recovery history is array
  ✓ recovery history has 1 entry
  ✓ recovery entry operation
  ✓ recovery after object exit code
  ✓ recovery after object output
  ✓ recovery after object has 1 entry
  ✓ recovery after object entry

Clear history
------------
  ✓ clear-history exit code
  ✓ clear-history output
  ✓ history after clear exit code
  ✓ history after clear output
  ✓ write after clear exit code
  ✓ write after clear output
  ✓ history after rewrite has 1 entry
  ✓ clear-history on empty exit code
  ✓ clear-history on empty output

History limit
-------------
  ✓ MAX_ENTRIES equals 50
  ✓ 10 entries all kept
  ✓ oldest entry is first op
  ✓ 50 entries stored
  ✓ oldest is op 1
  ✓ newest is op 50
  ✓ still 50 entries after 51st
  ✓ oldest is now op 2
  ✓ newest is op 51
  ✓ cli limit: 50 entries after 51 ops
  ✓ cli limit: oldest is op 2
  ✓ cli limit: newest is op 51
  ✓ custom limit: 3 entries kept
  ✓ custom limit: oldest is op 3
  ✓ custom limit: newest is op 5
  ✓ default limit: 50 entries kept
  ✓ default limit: oldest is op 2

Results: 110 passed, 0 failed
```

---

# Conclusion

Cette exécution de la série `php-calculator-cli` avec **Claude Code + `deepseek-v4-pro:cloud`** est une réussite nette.

Le modèle a terminé les **22 tests sur 22**, produit un projet final fonctionnel, robuste, documenté et fortement testé.

Le résultat est suffisamment propre pour être publié comme benchmark comparatif dans le dépôt `ai-agent-benchmarks`.

Verdict final :

```text
Excellent résultat sur petit projet PHP agentique. Modèle recommandé pour des tâches de génération, refactorisation et maintenance encadrées, avec supervision humaine légère sur Git et reporting.
```
