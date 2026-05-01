# Résultat benchmark — Claude Code + `kimi-k2.6:cloud`

## Statut du rapport

```text
Statut : terminé, publiable avec réserves mineures
```

Cette exécution de la série **`php-calculator-cli`** avec **Claude Code + `kimi-k2.6:cloud`** est globalement réussie.

Les **22 tests de benchmark sont présents dans `rapport.log`**, les commits de tests sont présents dans `git-log.txt`, l’architecture finale attendue est bien produite, et la suite finale passe.

La principale réserve concerne un écart entre le rapport et le fichier de tests final :

- `rapport.log` indique **46 / 46 tests passés** ;
- `final-tests.txt` contient **45 tests PASS**.

J’ai donc retenu **45 PASS / 0 FAIL** comme source finale, car c’est le fichier issu de la dernière exécution de la suite de tests.

---

# Informations générales

| Champ | Valeur |
|---|---|
| Série de benchmark | `php-calculator-cli` |
| Agent utilisé | Claude Code |
| Modèle utilisé | `kimi-k2.6:cloud` |
| Fournisseur / runtime | Ollama Cloud |
| Environnement indiqué | Windows 11 + WSL2 Debian |
| Date indiquée | 2026-04-30 |
| Commande de test principale | `docker compose run --rm php php tests/CalculatorTest.php` |
| Tests de benchmark présents | 22 / 22 |
| Tests automatisés finaux | 45 PASS / 0 FAIL |
| Commits de test | 24 |
| Total commits | 26 |
| Durée totale indiquée | environ 30 min |
| Working tree final | Code propre ; seul `benchmark-final-report/` est non suivi |

---

# Résumé exécutif

Le benchmark avec **Claude Code + `kimi-k2.6:cloud`** a été mené jusqu’au bout et produit un résultat solide.

Le modèle a réussi à construire progressivement un mini projet PHP 8.4 complet :

- calculatrice PHP sans framework ;
- CLI ;
- validation des arguments ;
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

Le projet final contient les trois classes attendues :

```text
Calculator
CalculatorCommand
HistoryRepository
```

Le run est aussi intéressant sur la vitesse : le bilan final indique environ **30 minutes** pour la série complète, ce qui est très bon pour un benchmark agentique de 22 tests.

---

# Verdict global

```text
Verdict : très bon résultat, publiable avec réserves mineures.
```

Kimi K2.6 termine la série officiellement et produit une architecture finale propre.  
Il est nettement plus rapide que les runs Qwen observés, tout en produisant un résultat plus robuste que Qwen3-Coder-Next.

Il reste légèrement en dessous du meilleur run DeepSeek Pro sur la richesse des tests finaux, mais le résultat est suffisamment propre pour être publié comme benchmark réussi.

---

# Score global proposé

| Catégorie | Note /5 | Commentaire |
|---|---:|---|
| Génération de code | 4.4 | Code simple, fonctionnel et bien adapté au périmètre. |
| Qualité du code | 4.2 | Architecture propre, quelques limites sur la couverture finale. |
| Respect des consignes | 4.5 | Les 22 tests sont présents et documentés. |
| Usage Docker | 4.5 | Les tests sont lancés via Docker dans le rapport final. |
| Tests | 4.0 | Couverture correcte avec 45 PASS, mais moins riche que DeepSeek Pro. |
| Refactorisation | 4.4 | Refactors réussis vers `HistoryRepository` et `CalculatorCommand`. |
| Architecture | 4.4 | Séparation claire des responsabilités. |
| Documentation | 4.0 | README clair, globalement aligné avec le projet final. |
| Git / commits | 4.4 | Commits de tests présents et propres. |
| Mise à jour `rapport.log` | 4.0 | Rapport complet, mais conserve le template et présente un écart 46 vs 45. |
| Robustesse | 4.3 | Bonne gestion JSON absent/vide/invalide/objet et limite 50 entrées. |
| Autonomie | 4.5 | Série complète terminée sans dérive. |
| Vitesse | 4.7 | Environ 30 minutes pour 22 tests : excellent résultat. |

## Note globale proposée

```text
4.4 / 5
```

---

# Tableau récapitulatif des 22 tests

| N° | Test | Résultat | Tests indiqués | Durée | Commit |
|---:|---|---|---:|---:|---|
| 1 | Création d'une base PHP simple | Réussi | 3 pass / 0 fail | ~2 min | `4b62e4b` |
| 2 | Ajouter subtract() | Réussi | 6 pass / 0 fail | ~1 min | `6f9781d` |
| 3 | Ajouter multiply() | Réussi | 10 pass / 0 fail | ~1 min | `6eeb485` |
| 4 | Ajouter divide() avec exception | Réussi | 14 pass / 0 fail | ~1 min | `6ce7904` |
| 5 | Refactor des tests | Réussi | 15 pass / 0 fail | ~1 min | `4e04cf2` |
| 6 | Ajouter une mini CLI | Réussi | 21 pass / 0 fail | ~2 min | `bbc4d67` |
| 7 | Robustesse CLI : validation des arguments | Réussi | 25 pass / 0 fail | ~1 min | `1303820` |
| 8 | Documentation uniquement | Réussi | 25 pass / 0 fail | ~1 min | `a52d6c5` |
| 9 | Bugfix volontaire sur divide() | Réussi | 25 pass / 0 fail | ~2 min | `6a662e1` |
| 10 | Historique JSON des opérations CLI | Réussi | 32 pass / 0 fail | ~3 min | `c0a26ac` |
| 11 | Refactor architecture de l'historique | Réussi | 32 pass / 0 fail | ~2 min | `f1c7954` |
| 12 | Correction documentation/tests après revue | Réussi | 32 pass / 0 fail | ~1 min | `dee0058` |
| 13 | Revue de code sans modification | Réussi | 32 pass / 0 fail | ~2 min | `3b23191` |
| 14 | Application sélective de la revue | Réussi | 35 pass / 0 fail | ~2 min | `3cd7306` |
| 15 | Composer / autoload PSR-4 | Réussi | 35 pass / 0 fail | ~2 min | `1912658` |
| 16 | Reproductibilité Composer / vendor / .gitignore | Réussi | 35 pass / 0 fail | ~1 min | `df7d23a` |
| 17 | Robustesse de history.json vide ou corrompu | Réussi | 41 pass / 0 fail | ~2 min | `cc9eba0` |
| 18 | Ajouter clear-history | Réussi | 43 pass / 0 fail | ~2 min | `e8bcef7` |
| 19 | Refactor CLI vers une classe dédiée | Réussi | 43 pass / 0 fail | ~2 min | `67c9f85` |
| 20 | Limiter l'historique à 50 entrées | Réussi | 46 pass / 0 fail | ~2 min | `1641a8f` |
| 21 | Revue finale complète sans modification | Réussi | 46 pass / 0 fail | ~2 min | `73cabcb` |
| 22 | Application sélective de la revue finale | Réussi | 46 pass / 0 fail | ~2 min | `af13914` |

---

# Statistiques finales

| Métrique | Valeur |
|---|---:|
| Tests benchmark terminés | 22 / 22 |
| Tests réussis selon `rapport.log` | 22 |
| Tests réussis avec réserve selon `rapport.log` | 0 |
| Tests échoués selon `rapport.log` | 0 |
| Tests automatisés finaux retenus | 45 PASS / 0 FAIL |
| Tests automatisés indiqués dans `rapport.log` | 46 / 46 |
| Commits de test | 24 |
| Total commits | 26 |
| Rapport final ajouté | Oui |
| Working tree | Source propre ; dossier de collecte non suivi |

---

# Analyse du code final

## Architecture finale

Le projet final est structuré ainsi :

```text
src/
├── Calculator.php
├── CalculatorCommand.php
└── HistoryRepository.php

bin/
└── calculator.php

tests/
└── CalculatorTest.php
```

L’architecture cible est atteinte.

## `Calculator`

La classe `Calculator` reste centrée sur les opérations mathématiques :

- `add()`
- `subtract()`
- `multiply()`
- `divide()`

La division par zéro est correctement gérée avec une `InvalidArgumentException`.

## `CalculatorCommand`

La classe `CalculatorCommand` orchestre la CLI :

- dispatch des commandes ;
- validation des arguments ;
- gestion des commandes `history` et `clear-history` ;
- appel au calculateur ;
- enregistrement dans l’historique ;
- gestion des erreurs métier.

Le point d’entrée `bin/calculator.php` est réduit à un rôle simple :

```text
autoload → instanciation de CalculatorCommand → exécution
```

## `HistoryRepository`

La classe `HistoryRepository` gère :

- lecture de l’historique ;
- écriture JSON ;
- verrouillage en écriture via `flock()` ;
- récupération si fichier absent, vide, invalide ou non conforme ;
- limite d’historique à 50 entrées par défaut ;
- limite configurable via constructeur ;
- vidage via `clear()` ;
- formatage de l’historique.

La logique de persistance est donc correctement séparée de la logique de calcul et de la logique CLI.

---

# Qualité du code généré

## Appréciation globale

La qualité du code généré est **bonne à très bonne** pour le périmètre du benchmark.

Kimi K2.6 produit un code clair, simple et suffisamment structuré. L’agent ne sur-complexifie pas le projet et suit correctement la progression demandée : base simple, ajout de fonctionnalités, historique, refactor, Composer, robustesse, puis architecture finale.

La qualité finale est supérieure au run Qwen3-Coder-Next analysé précédemment, notamment grâce à une meilleure robustesse de l’historique et une séparation plus claire des responsabilités.

## Points positifs

- Code PHP lisible et simple.
- Classes principales attendues présentes.
- Responsabilités bien séparées.
- `bin/calculator.php` léger.
- Composer PSR-4 correctement utilisé.
- `vendor/` ignoré.
- `var/history.json` ignoré via `.gitignore`.
- Historique robuste face aux fichiers absents, vides ou invalides.
- Limite de 50 entrées appliquée dans `HistoryRepository`.
- Pas de dépendance externe inutile.
- README globalement clair et utilisable.

## Points perfectibles

- La suite finale contient 45 tests PASS, ce qui reste inférieur au meilleur run DeepSeek Pro.
- Le rapport conserve le template et l’exemple d’entrée, ce qui le rend moins propre.
- Le rapport indique 46 tests finaux, alors que `final-tests.txt` en contient 45.
- Les tests CLI reposent sur `shell_exec()`, ce qui est acceptable ici mais moins robuste qu’un vrai runner.
- Pas de test final évident dédié à la limite configurable introduite au test 22.
- `HistoryRepository::format()` suppose que les entrées valides possèdent tous les champs attendus.

## Évaluation qualité du code

| Critère | Note | Commentaire |
|---|---:|---|
| Lisibilité | 4.4/5 | Code clair et facile à comprendre. |
| Simplicité | 4.5/5 | Solution pragmatique, sans sur-ingénierie. |
| Architecture | 4.4/5 | Responsabilités bien séparées. |
| Maintenabilité | 4.1/5 | Bonne base, tests perfectibles si le projet grossit. |
| Robustesse | 4.3/5 | Bons cas limites JSON et CLI. |
| Style PHP | 4.2/5 | Style moderne et cohérent avec PHP 8.4. |
| Dette technique | 4/5 | Dette faible pour un mini projet pédagogique. |

---

# Points forts observés

## 1. Série complète terminée

Les 22 tests sont présents dans `rapport.log` et les 22 commits de tests sont présents dans l’historique Git.

## 2. Très bonne vitesse

Le bilan final indique environ **30 minutes** pour toute la série, ce qui est excellent.

## 3. Architecture finale propre

Le découpage final est celui attendu :

```text
Calculator
CalculatorCommand
HistoryRepository
```

## 4. Robustesse correcte

L’historique JSON gère correctement :

- fichier absent ;
- fichier vide ;
- JSON invalide ;
- JSON objet au lieu de liste ;
- réécriture après corruption ;
- limite à 50 entrées.

## 5. Git globalement propre

L’historique contient les commits de tests attendus.  
Le statut final ne montre que le dossier de collecte `benchmark-final-report/` comme non suivi.

---

# Limites et réserves

## 1. Écart entre `rapport.log` et `final-tests.txt`

Le rapport indique 46 tests passés, mais le fichier final contient 45 lignes `[PASS]`.

Ce n’est pas bloquant, car les tests finaux passent, mais il faut le signaler.

## 2. Rapport encore encombré par le template

`rapport.log` contient encore le template et l’exemple initial du test 18.

Cela ne gêne pas l’analyse, mais ce n’est pas idéal pour une publication brute.

## 3. Couverture inférieure à DeepSeek Pro

La suite finale est solide, mais moins complète que le run DeepSeek Pro, qui avait produit 110 tests automatisés.

## 4. Tests CLI via `shell_exec()`

C’est acceptable pour le benchmark, mais moins propre qu’un système de test CLI plus isolé.

---

# Performance / latence

C’est l’un des meilleurs points du run.

| Modèle | Temps observé / indiqué |
|---|---|
| Qwen3-Coder 480B Cloud | 15 min à 1 h par test |
| Qwen3-Coder Next Cloud | environ 50 à 60 min pour toute la série |
| Kimi K2.6 Cloud | environ 30 min pour toute la série |

Kimi K2.6 apparaît donc comme très intéressant pour un workflow agentique complet : rapide, stable et capable de terminer la série.

---

# Recommandation de publication

Je recommande de publier ce résultat dans :

```text
results/php-calculator-cli/claude-code-kimi-k2-6-cloud.md
```

Le rapport peut être publié comme résultat réussi, avec une réserve mineure sur l’écart entre `rapport.log` et `final-tests.txt`.

---

# Git log analysé

```text
3b7df73 init benchmark workspace
4b62e4b test01: create basic calculator project
a2354d2 test01: update rapport.log with commit hash
6f9781d test02: add subtract operation
6eeb485 test03: add multiply operation
6ce7904 test04: add divide operation
4e04cf2 test05: refactor calculator tests
bbc4d67 test06: add calculator cli
1303820 test07: validate cli arguments
a52d6c5 test08: improve documentation
6a662e1 test09: fix divide bug
c0a26ac test10: add json history
f1c7954 test11: extract history repository
dee0058 test12: improve history docs and tests
3b23191 test13: review codebase
3cd7306 test14: apply selected review improvements
1912658 test15: add composer autoload
df7d23a test16: fix composer vendor workflow
cc9eba0 test17: harden history json handling
e8bcef7 test18: add clear history command
67c9f85 test19: move cli logic to command class
1641a8f test20: limit history to last 50 entries
73cabcb test21: final code review
af13914 test22: apply selected final review improvements
d053a64 test22: update rapport.log with commit hash
e18177e final: add kimi-k2.6:cloud benchmark summary
```

---

# Résultat final des tests

```text
[PASS] add(1, 2)
[PASS] add(0, 0)
[PASS] add(2, -3)
[PASS] subtract(5, 3)
[PASS] subtract(0, 0)
[PASS] subtract(2, -3)
[PASS] multiply(2, 3)
[PASS] multiply(0, 5)
[PASS] multiply(-4, 3)
[PASS] multiply(-4, -3)
[PASS] divide(6, 3)
[PASS] divide(5, 2)
[PASS] divide(-10, 2)
[PASS] divide(1, 0) exception class
[PASS] divide(1, 0) exception message
[PASS] HistoryRepository getAll empty
[PASS] HistoryRepository getAll after save
[PASS] HistoryRepository saved operation
[PASS] cli add(1, 2)
[PASS] cli subtract(5, 3)
[PASS] cli multiply(2, 3)
[PASS] cli divide(6, 3)
[PASS] cli divide(1, 0)
[PASS] cli unknown command shows help
[PASS] cli missing argument shows help
[PASS] cli invalid number a
[PASS] cli invalid number b
[PASS] cli invalid float
[PASS] cli history empty
[PASS] cli history shows recorded operation
[PASS] history json operation
[PASS] history json a
[PASS] history json b
[PASS] history json result
[PASS] history json created_at is ISO 8601
[PASS] history missing file
[PASS] history empty file
[PASS] history invalid json
[PASS] history json object
[PASS] history overwrite corrupted
[PASS] cli clear-history
[PASS] cli history after clear
[PASS] history limit 50 entries
[PASS] history limit oldest removed
[PASS] history limit newest kept

All tests passed.
```

---

# Conclusion

Cette exécution de **Claude Code + `kimi-k2.6:cloud`** est une réussite.

Le modèle termine les **22 tests sur 22**, produit une architecture propre, maintient les tests au vert et offre une très bonne vitesse d’exécution.

Il ne surpasse pas DeepSeek Pro sur la richesse de la suite de tests finale, mais il obtient un excellent compromis entre vitesse, stabilité et qualité du code.

Verdict final :

```text
Très bon résultat. Modèle rapide, stable et publiable comme benchmark réussi, avec réserves mineures sur le reporting.
```
