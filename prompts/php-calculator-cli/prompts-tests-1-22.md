# Prompts de benchmark — Agent IA sur mini projet PHP

Ce fichier contient les **22 prompts complets** pour rejouer le benchmark d’un agent IA de développement sur un mini projet PHP.

L’objectif est de pouvoir tester différents modèles ou agents, étape par étape, dans les mêmes conditions :

- Claude Code ;
- Codex CLI ;
- Aider ;
- OpenCode ;
- DeepSeek ;
- Qwen ;
- modèles cloud ;
- modèles locaux via Ollama.

Chaque test doit être lancé **un par un**, dans l’ordre.

À la fin de chaque test, l’agent doit :

1. mettre à jour `rapport.log` ;
2. lancer les tests via Docker ;
3. faire un commit Git avec `git add .` puis `git commit`.

Ainsi, à la fin des 22 tests, il suffit de transmettre :

- le contenu de `rapport.log` ;
- éventuellement `git log --oneline` ;
- éventuellement `git diff` si le dernier test n’a pas été commité.

---

# Objectifs du benchmark

Ce benchmark vise à évaluer la capacité d’un agent IA à travailler comme un assistant de développement sur un petit projet PHP réel mais contrôlé.

Les objectifs sont de mesurer :

## 1. Génération de code

Vérifier si l’agent sait créer une base de projet simple, lisible, sans dépendances inutiles.

## 2. Ajout progressif de fonctionnalités

Tester la capacité à ajouter des méthodes, enrichir une CLI et conserver le comportement existant.

## 3. Tests et non-régression

Observer si l’agent ajoute des tests pertinents, les lance correctement et garde une suite verte.

## 4. Correction de bugs

Évaluer la capacité à diagnostiquer un bug existant, corriger uniquement le nécessaire et expliquer la cause.

## 5. Refactorisation

Tester si l’agent sait améliorer l’architecture sans casser le comportement.

## 6. Robustesse

Vérifier la gestion des cas limites :

- arguments CLI invalides ;
- division par zéro ;
- fichier JSON absent ;
- fichier JSON vide ;
- fichier JSON corrompu ;
- historique trop long.

## 7. Documentation

Mesurer la capacité à maintenir un README cohérent avec le code.

## 8. Git et reproductibilité

Évaluer si l’agent gère correctement :

- `git status` ;
- `.gitignore` ;
- `vendor/` ;
- `var/history.json` ;
- commits propres ;
- rapport final dans `rapport.log`.

## 9. Discipline agentique

Vérifier que l’agent respecte les contraintes :

- ne pas modifier `docker-compose.yml` sans demande ;
- ne pas utiliser le PHP local WSL ;
- ne pas réécrire tout le projet ;
- ne pas appliquer plus que ce qui est demandé ;
- terminer par un rapport et un commit.

---

# Prérequis

## Environnement attendu

Le benchmark est prévu pour un environnement :

- Windows 11 + WSL2 Debian ou Linux ;
- Docker disponible ;
- Docker Compose v2 disponible ;
- Git disponible ;
- projet dans un dossier dédié, par exemple :

```bash
~/dev/project1
```

## Fichiers attendus avant le test 1

Le dossier peut être vide côté code PHP, mais il doit contenir au minimum un environnement Docker fonctionnel avec un service PHP nommé `php`.

Exemple minimal de commande de test attendue :

```bash
docker compose run --rm php php -v
```

La commande principale des tests sera :

```bash
docker compose run --rm php php tests/CalculatorTest.php
```

## Règles importantes

Pendant tout le benchmark :

- ne jamais utiliser le PHP local de WSL ;
- ne pas lancer `php tests/CalculatorTest.php` directement ;
- utiliser uniquement Docker pour exécuter PHP ;
- ne pas modifier `docker-compose.yml` sans demande explicite ;
- garder les changements petits et ciblés ;
- mettre à jour `rapport.log` à chaque test ;
- faire un commit Git à la fin de chaque test.

## Composer

Composer ne doit pas être supposé disponible dans le conteneur PHP.

Si Composer est nécessaire, utiliser l’image officielle :

```bash
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
```

ou, pour installer l’autoload :

```bash
docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer install
```

## Format recommandé de `rapport.log`

Chaque test doit ajouter une entrée de ce type :

```text
================================================================================
Test XX — Titre du test
Date :
Agent / modèle :
Objectif :
Fichiers modifiés :
Commandes exécutées :
Résultat des tests :
Durée estimée ou observée :
Difficultés rencontrées :
Verdict :
Commit :
================================================================================
```

Le fichier `rapport.log` ne doit jamais être écrasé pendant le benchmark.

---

# Consigne d’environnement à rappeler à l’agent

Tu peux ajouter ce bloc au début d’un échange si l’agent semble oublier les contraintes :

```text
Docker Compose v2 est disponible.

N’utilise jamais le PHP local de WSL pour ce projet.

Utilise uniquement ces commandes :
- Tests : docker compose run --rm php php tests/CalculatorTest.php
- Composer install si nécessaire :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer install
- Composer autoload si nécessaire :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload

Ne touche pas à docker-compose.yml sans demande explicite.

À la fin de chaque test :
- mets à jour rapport.log ;
- lance les tests via Docker ;
- fais git add . ;
- fais git commit.
```

---

# Prompts des 22 tests

## Test 1 — Création d’une base PHP simple

```text
Tu es dans un dossier projet PHP vide, sauf les fichiers Docker éventuellement déjà présents.

Objectif : créer une mini base PHP 8.4 sans framework pour tester l’agent.

Contraintes :
- commence par lire les fichiers présents ;
- vérifie l’état Git avec `git status` ;
- crée uniquement les fichiers nécessaires ;
- initialise une structure simple avec `src/`, `tests/` et `README.md` ;
- crée une classe `App\Calculator` avec une méthode `add(int $a, int $b): int` ;
- ajoute un test PHP simple sans PHPUnit dans `tests/CalculatorTest.php` ;
- ajoute une commande claire dans `README.md` pour lancer le test via Docker ;
- ne crée pas de dépendances Composer inutiles ;
- garde le code simple, lisible et pédagogique ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php
- commence par expliquer très brièvement ton plan, puis applique les changements.

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test01: create basic calculator project"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 2 — Ajouter `subtract()`

```text
Ajoute une méthode `subtract(int $a, int $b): int` à `App\Calculator`.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- modifie uniquement les fichiers nécessaires ;
- ajoute un test pour cette nouvelle méthode ;
- ne change pas le comportement existant ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test02: add subtract operation"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 3 — Ajouter `multiply()`

```text
Tu es dans un mini projet PHP avec une classe `Calculator` et des tests simples.

Objectif : ajouter une méthode `multiply(int $a, int $b): int`.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- modifie uniquement les fichiers nécessaires ;
- ajoute la méthode `multiply()` dans la classe `Calculator` ;
- ajoute plusieurs tests dans `tests/CalculatorTest.php` :
  - `2 * 3 = 6`
  - `0 * 5 = 0`
  - `-4 * 3 = -12`
  - `-4 * -3 = 12`
- mets à jour `README.md` si une section liste les fonctionnalités ;
- garde le style actuel du projet ;
- ne réécris pas tout le projet ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test03: add multiply operation"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 4 — Ajouter `divide()` avec exception

```text
Ajoute une méthode `divide(int $a, int $b): float` à la classe `Calculator`.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- modifie uniquement les fichiers nécessaires ;
- si `$b` vaut 0, lance une `InvalidArgumentException` avec le message exact :
  `Division by zero is not allowed.`
- ajoute les tests nécessaires dans `tests/CalculatorTest.php` :
  - `6 / 3 = 2.0`
  - `5 / 2 = 2.5`
  - `-10 / 2 = -5.0`
  - division par zéro : vérifie que `InvalidArgumentException` est bien levée avec le bon message ;
- mets à jour `README.md` si la liste des fonctionnalités existe ;
- garde le style actuel du projet ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test04: add divide operation"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 5 — Refactor des tests

```text
Refactorise `tests/CalculatorTest.php` pour réduire les répétitions.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne change pas le comportement testé ;
- garde tous les cas de test actuels ;
- crée si utile une petite fonction helper pour afficher les résultats ;
- garde le fichier simple et lisible, sans framework ;
- ne touche pas à `docker-compose.yml` ;
- ne modifie `Calculator.php` que si c’est strictement nécessaire ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test05: refactor calculator tests"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 6 — Ajouter une mini CLI

```text
Ajoute une mini CLI dans `bin/calculator.php`.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- crée le dossier `bin/` si nécessaire ;
- la CLI doit permettre :
  - `php bin/calculator.php add 1 2`
  - `php bin/calculator.php subtract 5 3`
  - `php bin/calculator.php multiply 2 3`
  - `php bin/calculator.php divide 6 3`
- affiche uniquement le résultat numérique pour les commandes valides ;
- en cas de commande inconnue, affiche une aide simple ;
- en cas de division par zéro, affiche le message d’erreur de l’exception ;
- ajoute ou adapte les tests nécessaires ;
- mets à jour `README.md` ;
- garde le code simple, sans framework ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test06: add calculator cli"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 7 — Robustesse CLI : validation des arguments

```text
Améliore la CLI `bin/calculator.php`.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- vérifie que les arguments numériques sont bien fournis ;
- si un argument manque, affiche l’aide ;
- si un argument n’est pas un entier valide, affiche exactement :
  `Invalid number.`
- conserve le comportement actuel pour les commandes valides ;
- ajoute les tests nécessaires ;
- mets à jour `README.md` si nécessaire ;
- ne touche pas à `docker-compose.yml` ;
- garde le code simple ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test07: validate cli arguments"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 8 — Documentation uniquement

```text
Lis `README.md`, `bin/calculator.php` et `tests/CalculatorTest.php`.

Améliore uniquement `README.md` pour documenter clairement :
- les prérequis ;
- la structure du projet ;
- les commandes CLI disponibles ;
- comment lancer les tests avec Docker ;
- les erreurs possibles de la CLI.

Contraintes :
- vérifie l’état Git avec `git status` ;
- ne touche à aucun fichier PHP ;
- ne touche pas à `docker-compose.yml` ;
- garde un ton simple et pédagogique ;
- ne modifie que `README.md` et `rapport.log` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test08: improve documentation"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 9 — Bugfix volontaire sur `divide()`

```text
Il y a un bug dans le projet.

Avant de corriger, vérifie que la méthode `divide()` contient bien un bug de division entière. Si le bug n’est pas présent, introduis volontairement ce bug minimal dans `src/Calculator.php` :

```php
public function divide(int $a, int $b): float
{
    if ($b === 0) {
        throw new InvalidArgumentException('Division by zero is not allowed.');
    }

    return intdiv($a, $b);
}
```

Ensuite :
- lis les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- lance les tests via Docker ;
- identifie la cause ;
- corrige uniquement le nécessaire ;
- relance les tests.

Contraintes :
- ne réécris pas tout le projet ;
- ne touche pas à `docker-compose.yml` ;
- explique brièvement la cause du bug ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test09: fix divide bug"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 10 — Historique JSON des opérations CLI

```text
Ajoute un historique local des opérations CLI.

Objectif :
Chaque commande CLI valide doit être enregistrée dans un fichier JSON local.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- modifie uniquement les fichiers nécessaires ;
- chaque commande CLI valide doit être enregistrée dans `var/history.json` ;
- stocker pour chaque opération :
  - `operation`
  - `a`
  - `b`
  - `result`
  - `created_at` au format ISO 8601
- ajoute une commande :
  `php bin/calculator.php history`
- cette commande doit afficher l’historique de manière lisible ;
- crée `var/.gitkeep` si utile ;
- ajoute ou corrige `.gitignore` pour éviter de versionner `var/history.json` ;
- ajoute les tests nécessaires ;
- mets à jour `README.md` ;
- n’utilise jamais le PHP local de WSL ;
- utilise uniquement Docker pour les tests :
  docker compose run --rm php php tests/CalculatorTest.php
- ne touche pas à `docker-compose.yml` ;
- garde une architecture simple, sans framework.

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test10: add json history"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 11 — Refactor architecture de l’historique

```text
Refactorise la gestion de l’historique.

Objectif :
- garder `Calculator` centré uniquement sur les opérations mathématiques ;
- créer une classe dédiée `App\HistoryRepository` pour gérer `var/history.json` ;
- déplacer toute la logique de lecture/écriture de l’historique hors de `Calculator` ;
- conserver exactement le comportement actuel de la CLI ;
- adapter les tests si nécessaire.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test11: extract history repository"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 12 — Correction documentation/tests après revue

```text
Corrige uniquement la documentation et les tests liés à l’historique.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- mets à jour `README.md` pour mentionner `src/HistoryRepository.php` ;
- retire l’idée que `Calculator.php` gère l’historique ;
- renforce le test ISO 8601 avec une expression régulière ;
- évite que les tests d’historique dépendent trop de l’ordre d’exécution ;
- ne change pas le comportement de la CLI ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test12: improve history docs and tests"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 13 — Revue de code sans modification

```text
Fais une revue de code du projet.

Objectif :
Produire une revue utile sans modifier le code du projet.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne modifie aucun fichier du projet, sauf `rapport.log` à la fin ;
- ne lance aucune correction automatique ;
- analyse :
  - la structure ;
  - la lisibilité ;
  - les tests ;
  - la CLI ;
  - la gestion de l’historique ;
  - la documentation ;
- liste les points forts ;
- liste les risques ou limites ;
- propose 5 améliorations priorisées ;
- reste concret et orienté PHP ;
- ne touche pas à `docker-compose.yml` ;
- n’utilise jamais le PHP local de WSL ;
- si tu lances les tests, utilise uniquement :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test13: review codebase"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 14 — Application sélective de la revue

```text
Applique uniquement ces améliorations issues de ta revue :

1. Ajouter un verrouillage fichier avec `flock()` dans `HistoryRepository` pour protéger l’écriture de `var/history.json`.
2. Éviter les paramètres vides dans les tests CLI pour la commande `history`, avec un helper dédié si nécessaire.
3. Ajouter un test direct sur `HistoryRepository::save()` et `HistoryRepository::getAll()`.
4. Supprimer la duplication du message d’aide dans `bin/calculator.php` en créant une fonction dédiée.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne crée pas de `public/index.php` ;
- ne modifie pas `docker-compose.yml` ;
- ne change pas le comportement CLI existant ;
- ne change pas les messages attendus ;
- utilise uniquement Docker pour lancer les tests :
  docker compose run --rm php php tests/CalculatorTest.php
- n’utilise jamais le PHP local de WSL ;
- applique uniquement les 4 améliorations demandées.

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test14: apply selected review improvements"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 15 — Composer / autoload PSR-4

```text
Ajoute Composer au projet pour gérer l’autoload PSR-4.

Objectif :
- créer ou corriger `composer.json` ;
- configurer l’autoload PSR-4 pour le namespace `App\\` vers `src/` ;
- adapter les `require` existants si nécessaire ;
- ne rajouter aucune dépendance externe ;
- mettre à jour `README.md` ;
- adapter les tests si nécessaire ;
- garder le comportement CLI existant.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne réécris pas tout le projet ;
- n’utilise jamais le PHP local de WSL ;
- ne suppose pas que Composer est installé dans le conteneur PHP ;
- si Composer est nécessaire, utilise l’image officielle :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
- lance les tests uniquement avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test15: add composer autoload"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 16 — Reproductibilité Composer / `vendor` / `.gitignore`

```text
Corrige la gestion Composer / vendor du projet.

Contexte :
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le conteneur PHP du docker-compose ne contient pas Composer.
- La commande `docker compose run --rm php composer install` ne doit pas être utilisée.
- Il faut utiliser l’image officielle Docker `composer:2` pour installer ou régénérer l’autoload.
- Le dossier `vendor/` ne doit pas être versionné dans Git.

Objectif :
Rendre le projet propre et reproductible après un clone frais.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ajoute ou corrige `.gitignore` si nécessaire ;
- ignore `vendor/` ;
- ignore `var/history.json` ;
- conserve `var/.gitkeep` si présent ;
- si `vendor/` est suivi par Git, retire-le de l’index sans le supprimer du disque ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne modifie pas l’architecture du projet ;
- mets à jour `README.md` avec les bonnes commandes Composer via Docker ;
- utilise cette commande pour régénérer l’autoload :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
- lance ensuite les tests avec :
  docker compose run --rm php php tests/CalculatorTest.php
- n’utilise jamais le PHP local de WSL.

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test16: fix composer vendor workflow"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 17 — Robustesse de `history.json` vide ou corrompu

```text
Améliore la robustesse de la gestion de l’historique JSON.

Contexte :
- Le projet possède une CLI dans `bin/calculator.php`.
- Les opérations valides sont enregistrées dans `var/history.json`.
- La lecture/écriture de l’historique est gérée par `App\HistoryRepository`.
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le dossier `vendor/` n’est pas versionné.
- Composer n’est pas disponible dans le conteneur PHP.

Objectif :
La commande `history` et l’enregistrement d’une nouvelle opération doivent rester robustes même si `var/history.json` est absent, vide ou corrompu.

Comportements attendus :
- si `var/history.json` n’existe pas, la commande `history` ne doit pas planter ;
- si `var/history.json` est vide, la commande `history` ne doit pas planter ;
- si `var/history.json` contient du JSON invalide, la commande `history` ne doit pas provoquer de fatal error ;
- si `var/history.json` contient une valeur JSON valide mais non conforme, par exemple un objet au lieu d’un tableau, la commande `history` ne doit pas planter ;
- une nouvelle opération valide doit pouvoir réécrire un historique propre si le fichier était vide ou corrompu ;
- le comportement CLI existant doit être conservé autant que possible ;
- les messages CLI déjà testés ne doivent pas changer sauf nécessité.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne réécris pas tout le projet ;
- garde une solution simple et pédagogique ;
- modifie uniquement les fichiers nécessaires ;
- ajoute les tests nécessaires dans `tests/CalculatorTest.php` ;
- n’utilise jamais le PHP local de WSL ;
- utilise uniquement Docker pour les tests ;
- si l’autoload doit être régénéré, utilise :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
- lance les tests avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test17: harden history json handling"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 18 — Ajouter `clear-history`

```text
Ajoute une commande CLI pour vider l’historique.

Contexte :
- Le projet possède une CLI dans `bin/calculator.php`.
- Les opérations valides sont enregistrées dans `var/history.json`.
- La gestion de l’historique est assurée par `App\HistoryRepository`.
- La commande `php bin/calculator.php history` affiche l’historique.
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le dossier `vendor/` n’est pas versionné.
- Composer n’est pas disponible dans le conteneur PHP.

Objectif :
Ajouter une commande :

`php bin/calculator.php clear-history`

Cette commande doit vider proprement l’historique.

Comportements attendus :
- `clear-history` doit supprimer ou réinitialiser `var/history.json` proprement ;
- après `clear-history`, la commande `history` doit afficher le comportement prévu pour un historique vide ;
- `clear-history` ne doit pas nécessiter d’arguments numériques ;
- `clear-history` doit afficher exactement :
  `History cleared.`
- les opérations existantes `add`, `subtract`, `multiply`, `divide` doivent conserver exactement leur comportement ;
- les messages CLI déjà testés ne doivent pas changer sauf nécessité ;
- la logique de suppression/réinitialisation doit rester dans `HistoryRepository`, pas directement dans `Calculator` ;
- `Calculator` doit rester centré uniquement sur les opérations mathématiques.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne réécris pas tout le projet ;
- garde une solution simple et pédagogique ;
- modifie uniquement les fichiers nécessaires ;
- ajoute les tests nécessaires dans `tests/CalculatorTest.php` ;
- mets à jour `README.md` si la liste des commandes CLI existe ;
- n’utilise jamais le PHP local de WSL ;
- utilise uniquement Docker pour les tests :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test18: add clear history command"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 19 — Refactor CLI vers une classe dédiée

```text
Refactorise la CLI vers une classe dédiée.

Contexte :
- Le projet possède une CLI dans `bin/calculator.php`.
- Les opérations disponibles sont :
  - `add`
  - `subtract`
  - `multiply`
  - `divide`
  - `history`
  - `clear-history`
- Les opérations mathématiques sont dans `App\Calculator`.
- La gestion de l’historique est dans `App\HistoryRepository`.
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le dossier `vendor/` n’est pas versionné.
- Composer n’est pas disponible dans le conteneur PHP.

Objectif :
Alléger `bin/calculator.php` en déplaçant la logique CLI dans une classe dédiée, par exemple `App\CalculatorCommand`.

Comportements à conserver :
- `php bin/calculator.php add 1 2` affiche uniquement le résultat numérique ;
- `php bin/calculator.php subtract 5 3` affiche uniquement le résultat numérique ;
- `php bin/calculator.php multiply 2 3` affiche uniquement le résultat numérique ;
- `php bin/calculator.php divide 6 3` affiche uniquement le résultat numérique ;
- `php bin/calculator.php divide 1 0` affiche le message d’erreur de l’exception ;
- `php bin/calculator.php history` affiche l’historique lisible ou le message prévu si l’historique est vide ;
- `php bin/calculator.php clear-history` vide l’historique et affiche :
  `History cleared.`
- les messages CLI déjà testés ne doivent pas changer ;
- les tests existants doivent continuer à passer.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne modifie pas le comportement CLI ;
- ne change pas les messages attendus ;
- ne réécris pas tout le projet ;
- garde une solution simple, lisible et pédagogique ;
- `bin/calculator.php` doit devenir un simple point d’entrée ;
- `Calculator` doit rester centré uniquement sur les opérations mathématiques ;
- `HistoryRepository` doit rester centré uniquement sur la persistance de l’historique ;
- ajoute une classe dédiée dans `src/` si nécessaire ;
- adapte les tests si nécessaire, mais ne supprime pas les cas existants ;
- mets à jour `README.md` si la structure du projet y est documentée ;
- n’utilise jamais le PHP local de WSL ;
- utilise uniquement Docker pour les tests ;
- si l’autoload doit être régénéré, utilise :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
- lance les tests avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test19: move cli logic to command class"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 20 — Limiter l’historique à 50 entrées

```text
Ajoute une limite de taille à l’historique.

Contexte :
- Le projet possède une CLI dans `bin/calculator.php`.
- La logique CLI a été déplacée dans `App\CalculatorCommand`.
- Les opérations mathématiques sont dans `App\Calculator`.
- La persistance de l’historique est dans `App\HistoryRepository`.
- Les opérations valides sont enregistrées dans `var/history.json`.
- La commande `history` affiche l’historique.
- La commande `clear-history` vide l’historique.
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le dossier `vendor/` n’est pas versionné.
- Composer n’est pas disponible dans le conteneur PHP.

Objectif :
Limiter l’historique aux 50 dernières opérations.

Comportements attendus :
- quand une nouvelle opération est enregistrée, l’historique doit conserver au maximum 50 entrées ;
- si l’historique contient moins de 50 entrées, rien ne doit être supprimé ;
- si l’historique contient déjà 50 entrées, l’ajout d’une nouvelle opération doit supprimer la plus ancienne entrée ;
- la commande `history` doit continuer à afficher les entrées dans l’ordre prévu par le comportement existant ;
- la commande `clear-history` doit continuer à vider tout l’historique ;
- le comportement des opérations `add`, `subtract`, `multiply`, `divide` ne doit pas changer ;
- les messages CLI déjà testés ne doivent pas changer.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne réécris pas tout le projet ;
- garde une solution simple et pédagogique ;
- modifie uniquement les fichiers nécessaires ;
- garde la responsabilité de la limite dans `HistoryRepository` ;
- évite de mettre cette logique dans `CalculatorCommand` ;
- ajoute les tests nécessaires dans `tests/CalculatorTest.php` ;
- ajoute si utile une constante claire, par exemple `MAX_ENTRIES = 50` ;
- mets à jour `README.md` si le comportement de l’historique y est documenté ;
- n’utilise jamais le PHP local de WSL ;
- utilise uniquement Docker pour les tests ;
- si l’autoload doit être régénéré, utilise :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
- lance les tests avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test20: limit history to last 50 entries"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 21 — Revue finale complète sans modification

```text
Fais une revue finale complète du projet.

Contexte :
- Le projet est une mini calculatrice CLI en PHP 8.4.
- Les opérations mathématiques sont dans `App\Calculator`.
- La logique CLI est dans `App\CalculatorCommand`.
- La persistance de l’historique est dans `App\HistoryRepository`.
- L’historique est stocké dans `var/history.json`.
- L’historique est limité aux 50 dernières opérations.
- La commande `clear-history` permet de vider l’historique.
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le dossier `vendor/` n’est pas versionné.
- Composer n’est pas disponible dans le conteneur PHP.
- Les tests sont dans `tests/CalculatorTest.php` sans PHPUnit.

Objectif :
Produire une revue de code complète et utile, sans modifier aucun fichier du projet.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne modifie aucun fichier du projet, sauf `rapport.log` à la fin ;
- ne lance aucune correction automatique ;
- ne touche pas à `docker-compose.yml` ;
- analyse :
  - l’architecture ;
  - la séparation des responsabilités ;
  - la lisibilité du code ;
  - la robustesse de la CLI ;
  - la gestion de l’historique JSON ;
  - la gestion Composer / autoload / vendor ;
  - les tests ;
  - la documentation README ;
  - les limites restantes ;
- vérifie si possible les tests avec :
  docker compose run --rm php php tests/CalculatorTest.php
- n’utilise jamais le PHP local de WSL ;
- termine par :
  - points forts ;
  - risques ou limites ;
  - 5 améliorations priorisées ;
  - verdict final.

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test21: final code review"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```

## Test 22 — Application sélective de la revue finale

```text
Applique uniquement certaines améliorations issues de la revue finale.

Contexte :
- Le projet est une mini calculatrice CLI PHP 8.4.
- Les opérations mathématiques sont dans `App\Calculator`.
- La logique CLI est dans `App\CalculatorCommand`.
- La persistance de l’historique est dans `App\HistoryRepository`.
- L’historique est limité aux 50 dernières opérations.
- La commande `clear-history` vide l’historique.
- Le projet utilise Composer uniquement pour l’autoload PSR-4.
- Le dossier `vendor/` n’est pas versionné.
- Composer n’est pas disponible dans le conteneur PHP.
- Les tests sont dans `tests/CalculatorTest.php` sans PHPUnit.
- La revue finale a identifié plusieurs améliorations possibles.

Objectif :
Appliquer uniquement les 3 améliorations suivantes :

1. Rendre la limite d’historique configurable dans `HistoryRepository` via le constructeur, tout en conservant 50 comme valeur par défaut.
2. Injecter `App\Calculator` dans `App\CalculatorCommand` au lieu de l’instancier en dur dans la classe.
3. Ajouter une entrée `.gitignore` pour ignorer les fichiers temporaires de test éventuels dans `var/`, sans ignorer `var/.gitkeep`.

Comportements à conserver :
- l’historique doit rester limité à 50 entrées par défaut ;
- le comportement CLI ne doit pas changer ;
- les messages CLI déjà testés ne doivent pas changer ;
- les commandes `add`, `subtract`, `multiply`, `divide`, `history` et `clear-history` doivent continuer à fonctionner ;
- les tests existants doivent continuer à passer.

Contraintes :
- lis d’abord les fichiers existants ;
- vérifie l’état Git avec `git status` ;
- ne touche pas à `docker-compose.yml` ;
- ne rajoute aucune dépendance externe ;
- ne migre pas vers PHPUnit ;
- ne crée pas de fichier de configuration complexe ;
- ne modifie pas les messages CLI ;
- ne modifie pas le format de `var/history.json` ;
- ne réécris pas tout le projet ;
- applique uniquement les 3 améliorations demandées ;
- garde une solution simple, lisible et pédagogique ;
- adapte ou ajoute les tests nécessaires ;
- mets à jour `README.md` uniquement si nécessaire ;
- n’utilise jamais le PHP local de WSL ;
- utilise uniquement Docker pour les tests ;
- si l’autoload doit être régénéré, utilise :
  docker run --rm -u "$(id -u):$(id -g)" -v "$PWD":/app -w /app composer:2 composer dump-autoload
- lance les tests avec :
  docker compose run --rm php php tests/CalculatorTest.php

Fin obligatoire du test :
- Ajoute une entrée à `rapport.log` en mode append, sans effacer les entrées précédentes.
- L’entrée de `rapport.log` doit contenir :
  - numéro et titre du test ;
  - objectif ;
  - fichiers modifiés ;
  - commandes exécutées ;
  - résultat des tests ;
  - durée estimée ou durée observée si disponible ;
  - difficultés rencontrées ;
  - verdict : réussi, réussi avec réserve ou échoué.
- Vérifie `git status` et `git diff --check`.
- Termine par un commit Git :
  git add .
  git commit -m "test22: apply selected final review improvements"
- Dans ta réponse finale, indique le hash du commit, les fichiers modifiés, le résultat des tests et le verdict du test.
```


---

# Exploitation du rapport final

À la fin des 22 tests, récupérer :

```bash
cat rapport.log
git log --oneline
git status
```

Puis transmettre :

1. le fichier `rapport.log` ;
2. le nombre final de tests passés ;
3. le modèle testé ;
4. les éventuelles erreurs ou réserves ;
5. le temps global approximatif.

Cela permettra de comparer les modèles sur une base homogène.

---

# Grille d’évaluation recommandée

| Critère | Note /5 | Commentaire |
|---|---:|---|
| Génération de code |  |  |
| Respect des consignes |  |  |
| Usage Docker |  |  |
| Tests |  |  |
| Refactor |  |  |
| Architecture |  |  |
| Documentation |  |  |
| Git / commits |  |  |
| Mise à jour `rapport.log` |  |  |
| Robustesse |  |  |
| Autonomie |  |  |
| Vitesse |  |  |

## Verdict final recommandé

```text
Modèle testé :
Agent utilisé :
Nombre de tests réussis :
Nombre de tests réussis avec réserve :
Nombre de tests échoués :
Nombre final de tests automatisés :
Note globale :
Conclusion :
```

