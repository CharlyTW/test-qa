# Cocon — Test technique QA

Mini-application Rails pour évaluer l’analyse ticket → MR → recette locale.

## Prérequis

- Docker + Docker Compose
- ~3h de travail (timing libre)

## Démarrage

```bash
docker compose up --build
```

Ouvre [http://localhost:3000](http://localhost:3000) — page d’accueil avec les liens de connexion démo.

### Connexion (comptes seed)

| URL | Rôle |
|-----|------|
| [/go/famille](http://localhost:3000/go/famille) | Sophie Martin · Famille |
| [/go/intervenant](http://localhost:3000/go/intervenant) | Camille Dubois · Intervenant·e |
| [/go/famille-petit](http://localhost:3000/go/famille-petit) | Lucas Petit · Famille |
| [/go/intervenant-benali](http://localhost:3000/go/intervenant-benali) | Nadia Benali · Intervenant·e |
| [/go/observateur](http://localhost:3000/go/observateur) | Alex Bernard · Famille (sans annonce, hors fils des autres) |

### Branche à recetter

```bash
git checkout feature/MSG-42
docker compose up --build
```

`main` contient auth + annonces **sans** messagerie.  
`feature/MSG-42` est la MR « livrée » à valider contre [`TICKET.md`](TICKET.md).

## Recette recommandée

1. Lit [`TICKET.md`](TICKET.md) et [`CONVENTIONS.md`](CONVENTIONS.md).
2. Ouvre **deux onglets** : un connecté `/go/famille`, un `/go/intervenant`.
3. Parcours les 3 écrans (fiche, inbox, fil) et vérifie les critères d’acceptation.
4. Relit le diff de `feature/MSG-42` vs `main` (conventions + specs).
5. Remplit [`RENDU.md`](RENDU.md) et rédige [`scenarios.feature`](scenarios.feature).

## Tests automatisés

```bash
docker compose exec web bundle exec rspec
```

## Budget indicatif (~3h)

| Phase | ~min |
|-------|------|
| Boot / Docker | 20 |
| Ticket + conventions | 25 |
| Recette (2 onglets) | 45 |
| Lecture MR / code | 40 |
| Rendu + Gherkin | 50 |

## Livrable

- [`RENDU.md`](RENDU.md) rempli (template imposé)
- [`scenarios.feature`](scenarios.feature) rédigé par toi (aucune trame fournie)
- **Bonus optionnel** (non pénalisé si absent) : specs et/ou correctifs

Rends une branche `rendu/<prenom>` ou un zip du dépôt.
