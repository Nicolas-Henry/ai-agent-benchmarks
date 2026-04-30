# Résultat benchmark — Claude Code + `qwen3-coder-next:cloud`

## Statut du rapport

```text
Statut : terminé, mais à publier avec réserves importantes
```

Cette exécution est nettement meilleure que le premier run Qwen3-Coder-Next : les **22 tests sont présents dans `rapport.log`**, les **22 commits de tests existent**, et la suite finale passe.

Cependant, le résultat ne doit pas être présenté comme équivalent aux rapports DeepSeek sans nuance. Le projet final est fonctionnel, mais la couverture de tests et la qualité d’implémentation sont plus faibles.

---

# Informations générales

| Champ | Valeur |
|---|---|
| Série de benchmark | `php-calculator-cli` |
| Agent utilisé | Claude Code |
| Modèle utilisé | `qwen3-coder-next:cloud` |
| Fournisseur / runtime | Ollama Cloud |
| Environnement indiqué | WSL2 / Linux |
| Date indiquée | 2026-04-30 |
| Commande de test principale | `docker compose run --rm php php tests/CalculatorTest.php` |
| Tests de benchmark présents | 22 / 22 |
| Tests automatisés finaux | 25 PASS / 0 FAIL |
| Commits de test | 22 |
| Total commits | 24 |
| Working tree final | Code propre, mais dossier `benchmark-final-report/` non suivi |

---

# Résumé exécutif

Le benchmark avec **Claude Code + `qwen3-coder-next:cloud`** a été mené jusqu’au bout.

Le run est intéressant pour deux raisons :

1. il termine les **22 tests** en environ **50 à 60 minutes**, ce qui est beaucoup plus exploitable que `qwen3-coder:480b-cloud` ;
2. il produit une architecture finale proche de l’objectif attendu :
   - `Calculator` ;
   - `HistoryRepository` ;
   - `CalculatorCommand` ;
   - `composer.json` ;
   - CLI fonctionnelle.

Mais plusieurs réserves empêchent de le noter au niveau de DeepSeek Pro :

- la suite finale ne contient que **25 tests PASS**, contre 110 pour le run DeepSeek Pro ;
- les tests CLI finaux sont quasi absents ;
- le test de robustesse “JSON objet au lieu d’un tableau” est incorrect : il accepte l’objet au lieu de le rejeter ;
- `HistoryRepository::save()` utilise `flock()`, mais écrit ensuite avec `file_put_contents()` au lieu d’écrire via le handle verrouillé ;
- la logique de `HistoryRepository::getAll()` ne valide pas que l’historique est une vraie liste d’entrées ;
- `CalculatorCommand` peut ne pas attraper correctement `InvalidArgumentException` dans l’espace de noms `App` ;
- le README n’est pas parfaitement aligné avec l’architecture finale.

---

# Verdict global

```text
Verdict : benchmark terminé, résultat exploitable avec réserves fortes.
```

Qwen3-Coder-Next est clairement plus utilisable que Qwen3-Coder 480B pour ce protocole. En revanche, le résultat final est plus fragile que les runs DeepSeek déjà publiés.

Je recommande de publier ce résultat seulement si tu assumes une catégorie du type :

```text
Résultats avec réserves
```

ou si le rapport indique clairement que le modèle a terminé la série, mais avec une qualité de code et de tests inférieure.

---

# Score global proposé

| Catégorie | Note /5 | Commentaire |
|---|---:|---|
| Génération de code | 3.8 | Le projet final est fonctionnel, mais plusieurs détails sont approximatifs. |
| Qualité du code | 3.4 | Architecture présente, mais implémentation moins robuste que DeepSeek. |
| Respect des consignes | 3.6 | Les 22 tests sont documentés, mais certains objectifs sont traités superficiellement. |
| Usage Docker | 4.5 | Les tests sont lancés via Docker dans le rapport. |
| Tests | 2.8 | Seulement 25 PASS finaux, avec peu de tests CLI et des tests de robustesse discutables. |
| Refactorisation | 3.6 | `CalculatorCommand` existe, mais la CLI garde encore une fonction d’aide dans `bin/calculator.php`. |
| Architecture | 3.7 | Les classes attendues existent, mais certaines responsabilités restent imparfaites. |
| Documentation | 3.2 | README utilisable mais incomplet, notamment sur `CalculatorCommand` et l’historique. |
| Git / commits | 4 | 22 commits de test présents. Dossier final de collecte non suivi. |
| Mise à jour `rapport.log` | 4 | Rapport complet cette fois, mais il conserve le template et l’exemple. |
| Robustesse | 3 | Cas limites partiellement couverts, mais validation JSON insuffisante. |
| Autonomie | 4 | La série est terminée sans dévier. |
| Vitesse | 4.3 | Environ 50 à 60 minutes pour les 22 tests : bon point fort du modèle. |

## Note globale proposée

```text
3.6 / 5
```

---

# Tableau récapitulatif des 22 tests

| N° | Test | Résultat | Tests indiqués | Durée | Commit |
|---:|---|---|---:|---:|---|
| 1 | Création d'une base PHP simple | Réussi | 3 pass / 0 fail | 3 min | `589d1ef` |
| 2 | Ajouter subtract() | Réussi | 6 pass / 0 fail | 1 min | `03cff4c` |
| 3 | Ajouter multiply() | Réussi |  pass /  fail | 1 min | `0733742` |
| 4 | Ajouter divide() | Réussi |  pass /  fail | 1 min | `3a070e5` |
| 5 | Refactor des tests | Réussi |  pass /  fail | 1 min | `bf8a07e` |
| 6 | Ajouter une mini CLI | Réussi |  pass /  fail | 1 min | `7ebeecd` |
| 7 | Robustesse CLI : validation des arguments | Réussi |  pass /  fail | 1 min | `108782c` |
| 8 | Documentation uniquement | Réussi |  pass /  fail | 1 min | `ae3e632` |
| 9 | Bugfix volontaire sur `divide()` | Réussi |  pass /  fail | 1 min | `97774bc` |
| 10 | Historique JSON des opérations CLI | Réussi |  pass /  fail | 2 min | `76a2775` |
| 11 | Refactor architecture de l'historique | Réussi |  pass /  fail | 1 min | `5c089a4` |
| 12 | Correction documentation/tests après revue | Réussi |  pass /  fail | 1 min | `c4c14d7` |
| 13 | Revue de code sans modification | Réussi |  pass /  fail | 2 min | `554131f` |
| 14 | Application sélective de la revue | Réussi |  pass /  fail | 3 min | `c5162df` |
| 15 | Composer / autoload PSR-4 | Réussi |  pass /  fail | 2 min | `36c1c14` |
| 16 | Reproductibilité Composer / vendor / .gitignore | Réussi |  pass /  fail | 1 min | `3ab694b` |
| 17 | Robustesse de `history.json` vide ou corrompu | Réussi |  pass /  fail | 2 min | `6de1ca8` |
| 18 | Ajouter clear-history | Réussi |  pass /  fail | 1 min | `1eb7c32` |
| 19 | Refactor CLI vers une classe dédiée | Réussi |  pass /  fail | 3 min | `e165091` |
| 20 | Limiter l'historique à 50 entrées | Réussi |  pass /  fail | 2 min | `f7644c1` |
| 21 | Revue finale complète sans modification | Réussi |  pass /  fail | 2 min | `a547949` |
| 22 | Application sélective de la revue finale | Réussi |  pass / 0 fail | 3 min | `7cc974f` |

---

# Statistiques finales

| Métrique | Valeur |
|---|---:|
| Tests benchmark terminés | 22 / 22 |
| Tests réussis selon `rapport.log` | 22 |
| Tests réussis avec réserve selon `rapport.log` | 0 |
| Tests échoués selon `rapport.log` | 0 |
| Tests automatisés finaux | 25 PASS / 0 FAIL |
| Commits de test | 22 |
| Total commits | 24 |
| Rapport final ajouté | Oui |
| Working tree | Fichiers source propres, dossier de collecte non suivi |

---

# Analyse du code final

## Architecture finale

Le projet contient les fichiers attendus :

```text
src/
├── Calculator.php
├── HistoryRepository.php
└── CalculatorCommand.php

bin/
└── calculator.php

tests/
└── CalculatorTest.php
```

L’architecture cible est donc globalement atteinte.

## `Calculator`

La classe est simple et correcte :

- `add()`
- `subtract()`
- `multiply()`
- `divide()`

La division par zéro utilise bien `InvalidArgumentException`.

## `CalculatorCommand`

La classe orchestre les commandes :

- `add`
- `subtract`
- `multiply`
- `divide`
- `history`
- `clear-history`

Elle apporte une séparation utile entre le point d’entrée CLI et la logique de commande.

Réserves :

- `bin/calculator.php` conserve encore une fonction `showHelp()`, alors que l’extraction complète de la logique CLI aurait pu aller plus loin ;
- `CalculatorCommand` attrape `InvalidArgumentException` sans import explicite ni préfixe global, ce qui peut poser problème dans le namespace `App`.

## `HistoryRepository`

La classe gère :

- sauvegarde ;
- lecture ;
- vidage ;
- limite configurable ;
- timestamps.

Réserves importantes :

- `save()` ouvre un fichier et pose un verrou, mais écrit ensuite via `file_put_contents()` au lieu d’écrire sur le handle verrouillé ;
- `getAll()` accepte un objet JSON décodé en tableau associatif au lieu de le rejeter ;
- les entrées de l’historique ne sont pas validées champ par champ ;
- `clear()` ne verrouille pas l’écriture ;
- le dossier `var/` est supposé exister.

---

# Qualité du code généré

## Appréciation globale

La qualité du code est **correcte**, mais inférieure aux deux runs DeepSeek déjà publiés.

Le modèle arrive à produire une base fonctionnelle et une architecture reconnaissable, mais plusieurs détails montrent un niveau de rigueur plus faible :

- tests moins nombreux ;
- robustesse JSON imparfaite ;
- couverture CLI faible ;
- documentation incomplète ;
- verrouillage fichier partiellement appliqué.

## Points positifs

- Les classes principales attendues existent.
- Le code reste lisible.
- Les méthodes mathématiques sont simples.
- Composer PSR-4 est présent.
- L’architecture générale est compréhensible.
- Le benchmark ne dévie pas de la série officielle.
- La vitesse est nettement meilleure que le modèle Qwen 480B.

## Points perfectibles

- Couverture de tests trop faible.
- Tests CLI insuffisants.
- Test JSON objet incorrect.
- `HistoryRepository` pas assez robuste.
- Verrouillage fichier perfectible.
- `README.md` pas totalement aligné.
- Aucune vraie validation de structure des entrées d’historique.
- Pas de test final sur la limite configurable.
- `var/history.json` est mentionné dans le README comme fichier de structure, alors qu’il devrait être généré.

## Évaluation qualité du code

| Critère | Note | Commentaire |
|---|---:|---|
| Lisibilité | 3.8/5 | Code lisible mais parfois simpliste. |
| Simplicité | 4/5 | Pas de sur-ingénierie. |
| Architecture | 3.7/5 | Architecture présente mais extraction incomplète. |
| Maintenabilité | 3.3/5 | Correct pour petit projet, mais fragile. |
| Robustesse | 3/5 | Plusieurs cas limites mal validés. |
| Style PHP | 3.5/5 | Correct, mais namespace/exception perfectible. |
| Dette technique | 3/5 | Dette modérée sur tests, historique et CLI. |

---

# Points forts observés

## 1. Run terminé

Contrairement au run Qwen 480B, celui-ci ne dévie pas complètement du protocole.

## 2. Très bonne vitesse relative

Environ 50 à 60 minutes pour la série complète, c’est exploitable pour un benchmark long.

## 3. Architecture cible présente

Les fichiers principaux attendus sont bien là :

- `Calculator`
- `HistoryRepository`
- `CalculatorCommand`

## 4. Git globalement exploitable

Les 22 commits de test sont présents.

---

# Limites et réserves

## 1. Suite de tests finale trop faible

Le résultat final contient seulement **25 PASS**.  
Pour comparaison :

- DeepSeek Flash : 44 PASS dans l’archive analysée ;
- DeepSeek Pro : 110 PASS ;
- Qwen Next : 25 PASS.

## 2. Robustesse JSON incorrecte

Le prompt demandait de ne pas planter si `history.json` contient un objet JSON au lieu d’un tableau d’entrées.

Le code final accepte l’objet décodé comme un tableau associatif. Le test correspondant valide ce comportement, au lieu de vérifier un retour vide.

## 3. Verrouillage fichier imparfait

Le verrou existe, mais l’écriture principale est faite avec `file_put_contents()` en dehors du handle verrouillé.

## 4. Documentation incomplète

Le README ne reflète pas totalement l’architecture finale, notamment `CalculatorCommand`.

## 5. Rapport à nettoyer

`rapport.log` contient encore le template et l’exemple d’entrée. Ce n’est pas bloquant, mais ce n’est pas idéal pour publication.

---

# Performance / latence

C’est le point fort majeur du run.

Tu as observé environ **50 minutes** pour l’ensemble des 22 tests, contre **15 minutes à 1 heure par test** pour `qwen3-coder:480b-cloud`.

Comparaison qualitative :

| Modèle | Temps observé |
|---|---|
| Qwen3-Coder 480B Cloud | 15 min à 1 h par test |
| Qwen3-Coder Next Cloud | environ 50 à 60 min pour toute la série |

Ce modèle est donc beaucoup plus adapté à un benchmark long.

---

# Recommandation de publication

Deux options sont possibles.

## Option 1 — Ne pas publier comme résultat principal

C’est l’option la plus stricte, car la qualité finale est nettement plus faible que DeepSeek.

## Option 2 — Publier avec réserves

Chemin recommandé :

```text
results/php-calculator-cli/claude-code-qwen3-coder-next-cloud.md
```

Mais le rapport doit indiquer clairement :

```text
Benchmark terminé, mais résultat avec réserves importantes sur la couverture de tests et la robustesse.
```

Je recommande l’option 2 si tu veux documenter aussi les résultats imparfaits, car le modèle a quand même terminé la série officielle.

---

# Recommandations pour un prochain run

Si tu veux améliorer la fiabilité sans changer la série de prompts :

1. utiliser un `rapport.log` vide, sans template ni exemple ;
2. ajouter une vérification manuelle après le test 17 ;
3. vérifier que `history.json` objet est bien traité comme historique non conforme ;
4. vérifier après le test 20 que la limite de 50 entrées a un test automatisé ;
5. vérifier après le test 22 que la limite configurable est testée.

---

# Git log analysé

```text
dc8ca0e init benchmark workspace
589d1ef test01: create basic calculator project
03cff4c test02: add subtract operation
0733742 test03: add multiply operation
3a070e5 test04: add divide operation
bf8a07e test05: refactor calculator tests
7ebeecd test06: add calculator cli
108782c test07: validate cli arguments
ae3e632 test08: improve documentation
97774bc test09: fix divide bug
76a2775 test10: add json history
5c089a4 test11: extract history repository
c4c14d7 test12: improve history docs and tests
554131f test13: review codebase
c5162df test14: apply selected review improvements
36c1c14 test15: add composer autoload
3ab694b test16: fix composer vendor workflow
6de1ca8 test17: harden history json handling
1eb7c32 test18: add clear history command
e165091 test19: move cli logic to command class
f7644c1 test20: limit history to last 50 entries
a547949 test21: final code review
7cc974f test22: apply selected final review improvements
1ae090f final: add qwen3-coder-next benchmark summary
```

---

# Résultat final des tests

```text
PASS: add 1 + 2 = 3
PASS: add 0 + 0 = 0
PASS: add -1 + 1 = 0
PASS: subtract 5 - 3 = 2
PASS: subtract 0 - 5 = -5
PASS: subtract -3 - -2 = -1
PASS: multiply 2 * 3 = 6
PASS: multiply 0 * 5 = 0
PASS: multiply -4 * 3 = -12
PASS: multiply -4 * -3 = 12
PASS: divide 6 / 3 = 2.0
PASS: divide 5 / 2 = 2.5
PASS: divide -10 / 2 = -5.0
PASS: divide by zero throws exception
PASS: HistoryRepository save and get
PASS: HistoryRepository returns empty array if no file
PASS: HistoryRepository ISO 8601 timestamp
PASS: HistoryRepository save multiple entries
PASS: HistoryRepository::save directly
PASS: HistoryRepository::getAll directly
PASS: HistoryRepository handles empty file
PASS: HistoryRepository handles invalid JSON
PASS: HistoryRepository handles JSON object instead of array
PASS: HistoryRepository recovers from corrupt JSON after save
PASS: HistoryRepository clear
```

---

# Conclusion

Cette exécution de **Claude Code + `qwen3-coder-next:cloud`** est exploitable, mais avec réserves.

Le modèle termine bien les 22 tests et offre une vitesse très intéressante. En revanche, la qualité finale du code, la couverture de tests et la robustesse sont en retrait par rapport aux meilleurs résultats déjà obtenus.

Verdict final :

```text
Benchmark terminé, modèle rapide et prometteur, mais qualité finale moyenne à bonne seulement. Publication possible avec réserves explicites.
```
