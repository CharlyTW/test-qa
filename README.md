# Cocon — Test technique QA

Mini-application Rails pour évaluer : compréhension d’un besoin produit → recette locale → lecture d’une livraison (branche) → documentation des écarts.

## Prérequis

- Docker + Docker Compose
- Environnement local pour ouvrir deux fenêtres de navigateur
- Budget indicatif : **~3 h** (timing libre ; prévoir une plage continue)

## Méthodologie

1. **Valider la compréhension** du besoin ([`TICKET.md`](TICKET.md)) et des conventions ([`CONVENTIONS.md`](CONVENTIONS.md)) par tous les moyens qui te semblent bons. **Pose librement tes questions** sur la spécification ou sur ce qui est attendu — mieux vaut clarifier tôt que de partir sur une mauvaise piste.
2. **Récupérer le dépôt**, démarrer l’application (voir ci-dessous), te connecter avec les comptes de démonstration.
3. **Comparer** le comportement attendu (ticket) au comportement fourni sur `feature/MSG-42` : recette manuelle (idéalement deux fenêtres), puis parcours du code / du diff vs `main`.
4. **Identifier** les écarts (fonctionnels, conventions, qualité) et les cas limites utiles pour des jeux de test.
5. **Documenter** clairement dans [`RENDU.md`](RENDU.md) et rédiger des scénarios dans [`scenarios.feature`](scenarios.feature).
6. **Optionnel** : renforcer les tests automatisés et/ou proposer des correctifs (voir bonus).

### Contacts

- **Charly** — [charly.hay@top-webgroup.com](mailto:charly.hay@top-webgroup.com) ou WhatsApp +33 6 04 19 99 57  
- **Nicolas** — [nicolas.aubanel@top-webgroup.com](mailto:nicolas.aubanel@top-webgroup.com)

## Démarrage

```bash
docker compose up --build
```

Ouvre [http://localhost:3000](http://localhost:3000) — page d’accueil avec les liens de connexion démo.

### Connexion (comptes seed)

| URL | Personne |
|-----|----------|
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

- `main` : authentification démo + annonces **sans** messagerie.  
- `feature/MSG-42` : livraison à valider contre [`TICKET.md`](TICKET.md).

## Déroulement recommandé

| Étape | Objectif |
|-------|--------|
| Ticket | Comprendre le produit voulu (écrans, comportements) et le hors périmètre |
| Recette | Parcourir fiche d’annonce, messagerie, fil ; deux fenêtres famille / intervenant·e |
| Analyse | Diff `feature/MSG-42`…`main`, conventions, specs existantes |
| Cas / scénarios | Cas particuliers et parcours dans `scenarios.feature` |
| Rendu | Erreurs, preuves, corrections suggérées, axes d’amélioration dans `RENDU.md` |
| Bonus | Specs et/ou correctifs (non pénalisé si absent) |

## Tests automatisés

Le choix d’**ajouter** des tests (RSpec, Capybara, etc.) est libre en bonus : documente alors prérequis, dépendances et commandes dans le rendu.

## Budget indicatif (~3 h)

| Phase | ~min |
|-------|------|
| Boot / Docker | 20 |
| Ticket + questions | 25 |
| Recette (2 fenêtres) | 45 |
| Lecture livraison / code | 40 |
| Rendu + scénarios | 50 |

## Livrable

Organisation :

- Rendre sur **GitHub** (ou Bitbucket) : donner l’accès **lecture** au compte associé à [charly.hay@top-webgroup.com](mailto:charly.hay@top-webgroup.com)  
  **ou** fournir un zip du dépôt.
- Branche suggérée : `rendu/<prenom>`.
- Présenter les résultats de façon **claire et compréhensible** (sévérité, attendu vs actuel, preuves).
- Commenter les tests ajoutés dans le code **ou** les décrire dans la documentation du rendu.

Contenu attendu :

1. [`RENDU.md`](RENDU.md) rempli (template imposé) — notamment :
   - les **erreurs / écarts** identifiés et les **corrections suggérées** (tu peux aussi corriger dans le code en bonus) ;
   - les **axes d’amélioration** (revue de code / qualité), limités au code utile au projet (pas besoin d’auditer Rails lui-même).
2. [`scenarios.feature`](scenarios.feature) — scénarios rédigés par toi (aucune trame fournie).
3. **Bonus optionnel** (non pénalisé si absent) : suite de tests renforcée et/ou correctifs.

Voir le détail des sections dans [`RENDU.md`](RENDU.md).
