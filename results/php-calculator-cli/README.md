# Résultats — PHP Calculator CLI

Ce dossier regroupe les résultats des benchmarks réalisés sur la série :

```text
php-calculator-cli
```

Cette série teste un agent IA de développement sur un mini projet PHP 8.4 : une calculatrice en ligne de commande, progressivement enrichie au fil de 22 tests.

L’objectif n’est pas seulement de vérifier si le code fonctionne, mais aussi d’évaluer :

- la qualité du code généré ;
- le respect des consignes ;
- l’usage correct de Docker ;
- la capacité à écrire et maintenir des tests ;
- la gestion de Git ;
- la documentation ;
- la robustesse ;
- la capacité à refactoriser proprement ;
- la qualité du reporting.

---

# Série de tests

La série complète contient **22 tests** :

| Bloc | Tests | Objectif |
|---|---:|---|
| Base projet | 1 à 5 | Création du projet, opérations de base, premiers tests |
| CLI | 6 à 7 | Ajout d’une interface en ligne de commande et validation des arguments |
| Documentation / bugfix | 8 à 9 | README et correction d’un bug volontaire |
| Historique JSON | 10 à 14 | Ajout de l’historique, refactor, verrouillage fichier, revue |
| Composer / Git | 15 à 16 | Autoload PSR-4, `vendor/`, `.gitignore`, reproductibilité |
| Robustesse | 17 à 18 | JSON vide/corrompu, commande `clear-history` |
| Architecture | 19 à 20 | Refactor CLI, limite d’historique |
| Revue finale | 21 à 22 | Audit final et application sélective des recommandations |

---

# Tableau comparatif

| Agent | Modèle | Runtime | Tests benchmark | Tests automatisés finaux | Note globale | Rapport |
|---|---|---|---:|---:|---:|---|
| Claude Code | `deepseek-v4-flash:cloud` | Ollama Cloud | 22/22 | 44 PASS | 4.4/5 | [Voir le rapport](./claude-code-deepseek-v4-flash.md) |
| Claude Code | `deepseek-v4-pro:cloud` | Ollama Cloud | 22/22 | 110 PASS | 4.6/5 | [Voir le rapport](./claude-code-deepseek-v4-pro.md) |

---

# Lecture rapide des résultats

## Claude Code + `deepseek-v4-flash:cloud`

Résultat global : **très bon**.

Le modèle termine les 22 tests et produit un projet final fonctionnel, documenté et correctement structuré.

Points forts :

- bonne génération de code ;
- bonne progression test après test ;
- refactors réussis ;
- code final lisible ;
- architecture correcte ;
- résultat exploitable pour un petit projet PHP.

Réserves principales :

- rapport initial moins complet ;
- nombre final de tests automatisés plus faible ;
- quelques limites sur le reporting et la traçabilité ;
- supervision humaine utile sur Git, Composer et Docker.

Rapport :

```text
claude-code-deepseek-v4-flash.md
```

---

## Claude Code + `deepseek-v4-pro:cloud`

Résultat global : **excellent**.

Le modèle termine également les 22 tests, avec une suite finale plus riche : **110 tests automatisés passés**.

Points forts :

- meilleure couverture de tests ;
- rapport plus complet ;
- hashes de commits présents ;
- architecture finale propre ;
- bonne qualité de code ;
- bonne robustesse ;
- meilleure traçabilité globale.

Réserves principales :

- historique Git plus chargé à cause de commits correctifs de rapport ;
- quelques points perfectibles sur la lecture verrouillée de l’historique ;
- supervision humaine toujours utile avant publication.

Rapport :

```text
claude-code-deepseek-v4-pro.md
```

---

# Comparaison rapide Flash vs Pro

| Critère | Flash | Pro |
|---|---|---|
| Complétion des 22 tests | Oui | Oui |
| Qualité du code | Bonne à très bonne | Bonne à très bonne |
| Couverture finale de tests | 44 PASS | 110 PASS |
| Rapport final | Correct, mais perfectible | Plus complet et mieux structuré |
| Traçabilité Git | Correcte | Meilleure, mais plus verbeuse |
| Robustesse finale | Bonne | Très bonne |
| Usage recommandé | Tests rapides, coût réduit | Benchmark plus poussé, meilleure qualité de sortie |

---

# Verdict comparatif

Les deux modèles terminent la série avec succès.

`deepseek-v4-flash:cloud` est déjà très convaincant pour un agent build PHP sur petit projet. Il offre un bon équilibre entre vitesse, coût et qualité.

`deepseek-v4-pro:cloud` produit un résultat plus complet, notamment sur la richesse des tests et la qualité du rapport final. Il semble plus adapté aux benchmarks approfondis, aux tâches longues ou aux workflows où la traçabilité est importante.

Verdict synthétique :

```text
Flash = très bon rapport efficacité / coût.
Pro = meilleur résultat global et meilleure couverture.
```

---

# Ajouter un nouveau résultat

Pour ajouter un nouveau benchmark, créer un fichier dans ce dossier avec le format :

```text
<agent>-<modele>.md
```

Exemples :

```text
codex-gpt-5-5.md
aider-qwen3-coder-480b-cloud.md
claude-code-qwen3-5-cloud.md
opencode-deepseek-v4-pro.md
```

Puis mettre à jour le tableau comparatif de ce README.

---

# Template utilisé

Les rapports de ce dossier suivent le modèle :

```text
../../templates/result-summary-template.md
```

Chaque rapport doit idéalement contenir :

- informations générales ;
- résumé exécutif ;
- score global ;
- tableau des 22 tests ;
- statistiques finales ;
- analyse du code final ;
- qualité du code généré ;
- points forts ;
- limites ;
- recommandations ;
- conclusion.
