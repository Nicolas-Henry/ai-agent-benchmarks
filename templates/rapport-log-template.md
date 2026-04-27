# Template `rapport.log` — Benchmark agent IA

Ce fichier sert de modèle pour le journal d’exécution d’une série de tests.

Il peut être copié en `rapport.log` à la racine du projet testé.

Chaque test doit ajouter une entrée à la suite du fichier, sans effacer les entrées précédentes.

---

# Informations générales

```text
Projet benchmark :
Série de prompts :
Agent utilisé :
Modèle utilisé :
Fournisseur / runtime :
Machine / environnement :
OS :
Docker :
Date de début :
Date de fin :
Commande de test principale :
```

Exemple :

```text
Projet benchmark : php-calculator-cli
Série de prompts : tests-1-22
Agent utilisé : Claude Code
Modèle utilisé : deepseek-v4-flash:cloud
Fournisseur / runtime : Ollama Cloud
Machine / environnement : Windows 11 + WSL2 Debian
OS : Debian sous WSL2
Docker : Docker Compose v2
Date de début : 2026-04-27
Date de fin :
Commande de test principale : docker compose run --rm php php tests/CalculatorTest.php
```

---

# Format d’une entrée de test

Copier ce bloc à la fin du fichier après chaque test.

```text
================================================================================
Test XX — Titre du test
================================================================================

Date :
Heure de début :
Heure de fin :
Durée observée :
Durée estimée si la durée réelle n’est pas disponible :

Agent :
Modèle :
Prompt utilisé :
Commit attendu :

Objectif :
-

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
Commande de test utilisée :

Respect des contraintes :
[ ] PHP local WSL non utilisé
[ ] Docker utilisé pour les tests
[ ] docker-compose.yml non modifié
[ ] Changements limités aux fichiers nécessaires
[ ] README mis à jour si nécessaire
[ ] rapport.log mis à jour
[ ] git diff --check exécuté
[ ] git add . exécuté
[ ] git commit exécuté

Points positifs :
-

Difficultés rencontrées :
-

Réserves :
-

Erreurs ou comportements inattendus :
-

Verdict :
[ ] Réussi
[ ] Réussi avec réserve
[ ] Échoué

Commit :
Hash :
Message :

Notes complémentaires :
-
```

---

# Exemple d’entrée remplie

```text
================================================================================
Test 18 — Ajouter clear-history
================================================================================

Date : 2026-04-27
Heure de début : 14:12
Heure de fin : 14:16
Durée observée : 4 min
Durée estimée si la durée réelle n’est pas disponible :

Agent : Claude Code
Modèle : deepseek-v4-flash:cloud
Prompt utilisé : Test 18 — Ajouter clear-history
Commit attendu : test18: add clear history command

Objectif :
- Ajouter une commande CLI permettant de vider l’historique JSON.

Fichiers lus :
- bin/calculator.php
- src/HistoryRepository.php
- tests/CalculatorTest.php
- README.md

Fichiers créés :
- Aucun

Fichiers modifiés :
- bin/calculator.php
- src/HistoryRepository.php
- tests/CalculatorTest.php
- README.md
- rapport.log

Fichiers supprimés :
- Aucun

Commandes exécutées :
- git status
- docker compose run --rm php php tests/CalculatorTest.php
- git diff --check
- git add .
- git commit -m "test18: add clear history command"

Résultat des tests :
- 42 / 42 tests passés

Nombre de tests passés : 42
Nombre de tests échoués : 0
Commande de test utilisée : docker compose run --rm php php tests/CalculatorTest.php

Respect des contraintes :
[x] PHP local WSL non utilisé
[x] Docker utilisé pour les tests
[x] docker-compose.yml non modifié
[x] Changements limités aux fichiers nécessaires
[x] README mis à jour si nécessaire
[x] rapport.log mis à jour
[x] git diff --check exécuté
[x] git add . exécuté
[x] git commit exécuté

Points positifs :
- La logique de vidage est placée dans HistoryRepository.
- Le comportement CLI existant est conservé.
- Les tests couvrent clear-history et l’historique vide.

Difficultés rencontrées :
- Aucune.

Réserves :
- clear-history accepte les arguments superflus sans erreur. Comportement acceptable pour ce test.

Erreurs ou comportements inattendus :
- Aucun.

Verdict :
[x] Réussi
[ ] Réussi avec réserve
[ ] Échoué

Commit :
Hash : abc1234
Message : test18: add clear history command

Notes complémentaires :
- Fonctionnalité validée.
```

---

# Checklist finale après la série complète

À compléter après le dernier test.

```text
================================================================================
Bilan final du rapport
================================================================================

Nombre total de tests :
Nombre de tests réussis :
Nombre de tests réussis avec réserve :
Nombre de tests échoués :

Nombre final de tests automatisés :
Dernier résultat des tests :
Dernier commit :
Working tree propre :
[ ] Oui
[ ] Non

Principales forces observées :
-

Principales limites observées :
-

Incidents importants :
-

Conclusion rapide :
-
```
