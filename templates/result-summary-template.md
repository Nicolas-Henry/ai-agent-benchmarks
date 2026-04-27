# Template de synthèse finale — Résultat benchmark par modèle

Ce fichier sert à publier le résultat final d’un modèle ou d’un agent sur une série de prompts.

Nom de fichier conseillé :

```text
results/<nom-serie>/<agent>-<modele>.md
```

Exemples :

```text
results/php-calculator-cli/claude-code-deepseek-v4-flash.md
results/php-calculator-cli/claude-code-deepseek-v4-pro.md
results/php-calculator-cli/codex-gpt-5-5.md
results/php-calculator-cli/aider-qwen3-coder-480b-cloud.md
```

---

# Résultat benchmark — `<Agent>` + `<Modèle>`

## Informations générales

| Champ | Valeur |
|---|---|
| Série de benchmark |  |
| Date du test |  |
| Agent utilisé |  |
| Modèle utilisé |  |
| Fournisseur / runtime |  |
| Langage cible | PHP 8.4 |
| Environnement |  |
| OS |  |
| Docker |  |
| Commande de test principale | `docker compose run --rm php php tests/CalculatorTest.php` |
| Nombre de tests dans la série | 22 |
| Nombre final de tests automatisés |  |
| Dépôt / branche |  |

---

# Résumé exécutif

```text
Résumé court du résultat :

Exemple :
Le modèle a terminé les 22 tests avec 19 réussites, 3 réussites avec réserve et 0 échec.
Il s’est montré très fiable sur la génération de code, les tests et les refactors simples,
mais moins rigoureux sur l’usage strict de Docker et certains aspects Git/Composer.
```

---

# Score global

| Catégorie | Note /5 | Commentaire |
|---|---:|---|
| Génération de code |  |  |
| Respect des consignes |  |  |
| Usage Docker |  |  |
| Tests |  |  |
| Refactorisation |  |  |
| Architecture |  |  |
| Documentation |  |  |
| Git / commits |  |  |
| Mise à jour `rapport.log` |  |  |
| Robustesse |  |  |
| Autonomie |  |  |
| Vitesse |  |  |

## Note globale proposée

```text
Note globale : /5
Verdict :
```

---

# Tableau récapitulatif des 22 tests

| N° | Test | Résultat | Tests automatisés | Durée | Réserve principale |
|---:|---|---|---:|---:|---|
| 1 | Création d’une base PHP simple |  |  |  |  |
| 2 | Ajouter `subtract()` |  |  |  |  |
| 3 | Ajouter `multiply()` |  |  |  |  |
| 4 | Ajouter `divide()` avec exception |  |  |  |  |
| 5 | Refactor des tests |  |  |  |  |
| 6 | Ajouter une mini CLI |  |  |  |  |
| 7 | Robustesse CLI : validation des arguments |  |  |  |  |
| 8 | Documentation uniquement |  |  |  |  |
| 9 | Bugfix volontaire sur `divide()` |  |  |  |  |
| 10 | Historique JSON des opérations CLI |  |  |  |  |
| 11 | Refactor architecture de l’historique |  |  |  |  |
| 12 | Correction documentation/tests après revue |  |  |  |  |
| 13 | Revue de code sans modification |  |  |  |  |
| 14 | Application sélective de la revue |  |  |  |  |
| 15 | Composer / autoload PSR-4 |  |  |  |  |
| 16 | Reproductibilité Composer / `vendor` / `.gitignore` |  |  |  |  |
| 17 | Robustesse de `history.json` vide ou corrompu |  |  |  |  |
| 18 | Ajouter `clear-history` |  |  |  |  |
| 19 | Refactor CLI vers une classe dédiée |  |  |  |  |
| 20 | Limiter l’historique à 50 entrées |  |  |  |  |
| 21 | Revue finale complète sans modification |  |  |  |  |
| 22 | Application sélective de la revue finale |  |  |  |  |

Légende suggérée :

- `Réussi`
- `Réussi avec réserve`
- `Échoué`

---

# Statistiques finales

| Métrique | Valeur |
|---|---:|
| Tests réussis |  |
| Tests réussis avec réserve |  |
| Tests échoués |  |
| Taux de réussite strict |  |
| Taux de réussite avec réserves |  |
| Nombre final de tests automatisés |  |
| Nombre de commits créés |  |
| Nombre de fois où Docker n’a pas été respecté |  |
| Nombre de modifications non demandées |  |
| Nombre de corrections manuelles nécessaires |  |

---

# Analyse par catégorie

## 1. Génération de code

```text
Évaluer :
- simplicité ;
- lisibilité ;
- absence de dépendances inutiles ;
- cohérence PHP ;
- respect du style existant.
```

Commentaire :

```text

```

## 2. Tests

```text
Évaluer :
- tests ajoutés ;
- pertinence ;
- non-régression ;
- exécution via Docker ;
- qualité du mini-framework maison.
```

Commentaire :

```text

```

## 3. Refactorisation

```text
Évaluer :
- capacité à extraire des responsabilités ;
- comportement conservé ;
- absence de réécriture excessive ;
- architecture finale.
```

Commentaire :

```text

```

## 4. Robustesse

```text
Évaluer :
- validation CLI ;
- division par zéro ;
- JSON vide ou corrompu ;
- historique limité ;
- fichiers absents ;
- verrouillage fichier.
```

Commentaire :

```text

```

## 5. Composer / Git / reproductibilité

```text
Évaluer :
- gestion de composer.json ;
- autoload PSR-4 ;
- vendor ignoré ;
- .gitignore ;
- rapport.log ;
- commits propres ;
- clone frais possible.
```

Commentaire :

```text

```

## 6. Documentation

```text
Évaluer :
- README ;
- clarté des commandes ;
- documentation des erreurs ;
- documentation de l’historique ;
- cohérence après refactor.
```

Commentaire :

```text

```

## 7. Discipline agentique

```text
Évaluer :
- respect des consignes ;
- pas de modifications inutiles ;
- pas de changement de docker-compose.yml ;
- pas de PHP local ;
- rapport final fidèle au diff.
```

Commentaire :

```text

```

---

# Points forts observés

```text
-
-
-
```

---

# Limites observées

```text
-
-
-
```

---

# Incidents ou réserves importantes

```text
-
-
-
```

---

# Comparaison attendue avec d’autres modèles

À remplir après plusieurs benchmarks.

| Modèle | Agent | Réussis | Réserves | Échecs | Note globale | Commentaire |
|---|---|---:|---:|---:|---:|---|
|  |  |  |  |  |  |  |

---

# Verdict final

```text
Verdict :

Exemple :
Très bon modèle pour des tâches agentiques PHP de petite taille.
Il est fiable sur les ajouts incrémentaux, les tests et les refactors modérés.
Supervision humaine recommandée sur Docker, Composer, Git et les résumés finaux.
```

---

# Recommandation d’usage

```text
Utilisation recommandée :
[ ] Non recommandé
[ ] Tests simples uniquement
[ ] Petites features encadrées
[ ] Refactors simples
[ ] Agent build fiable avec supervision
[ ] Agent autonome sur petits projets
[ ] Agent recommandé pour projet réel

Commentaire :

```

---

# Annexes

## Commandes utiles

```bash
cat rapport.log
git log --oneline
git status
docker compose run --rm php php tests/CalculatorTest.php
```

## Dernier état connu du projet

```text
Nombre final de tests :
Dernier commit :
Working tree propre :
```

## Notes libres

```text

```
