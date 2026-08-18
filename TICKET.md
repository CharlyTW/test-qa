# MSG-42 — Échanger par messagerie depuis une annonce

**Type :** Fonctionnalité  
**Produit :** Cocon  
**Branche de livraison :** `feature/MSG-42`

## Besoin

Sur Cocon, une famille et une intervenante (ou un intervenant) doivent pouvoir **se parler à partir d’une annonce**, sans quitter le site.

Aujourd’hui on peut consulter les annonces ; il manque un moyen simple de **démarrer une conversation**, de **suivre ses échanges** et de **recevoir les nouveaux messages pendant qu’on est déjà sur la page**.

## Ce que l’utilisateur doit pouvoir faire

### Depuis une fiche d’annonce

- Voir un bouton **« Contacter »** pour écrire à l’auteur de l’annonce.
- Ce bouton **n’apparaît pas** sur sa propre annonce : on ne démarre pas une conversation avec soi-même.
- L’application doit aussi **empêcher** de créer cette conversation « avec soi-même » si quelqu’un contourne l’interface (le masquage du bouton ne suffit pas).

### Dans la messagerie (liste des conversations)

- Retrouver toutes ses conversations, **la plus récente en premier**.
- Voir d’un coup d’œil s’il y a des **messages non lus** (pastille / compteur dans la navigation et sur les lignes concernées).
- Quand il n’y a **aucune** conversation : un écran dédié avec le texte  
  **« Aucune conversation pour le moment. »**  
  (pas une liste vide sans explication).
- **Archiver** une conversation : elle disparaît de **ma** liste seulement. L’autre personne la voit toujours. Archiver **n’équivaut pas** à bloquer : si l’autre m’écrit à nouveau, la conversation **réapparaît chez moi**.

### Dans un fil de discussion

- Lire l’historique et envoyer un message texte.
- Tant que le fil est **ouvert devant moi**, un message de l’autre apparaît **tout de suite**, sans que j’aie à recharger la page.
- Si je suis ailleurs sur le site (messagerie ou autre page avec la barre du haut), le **compteur de non-lus** se met à jour **dès l’arrivée** du message, toujours sans recharger.
- Ouvrir le fil remet mon compteur de non-lus à zéro pour cette conversation.
- Seules les **personnes de la conversation** peuvent ouvrir ce fil. Une autre personne connectée qui essaie d’y accéder doit être refusée (retour à la messagerie ou message d’erreur clair).

### Affichage des personnes

Sur les annonces et dans la messagerie, on montre d’abord le **prénom et le nom**, puis le **rôle** en complément (Famille ou Intervenant·e).

## Hors périmètre

- Pièces jointes (photos, documents…)
- Alertes par e-mail ou notification téléphone
- Modération automatique des messages
- Quotas, abonnements, paiement
- Fonction « bloquer un utilisateur »
- Un canal de discussion externe au site (hors de Cocon)

## Pistes pour la mise en œuvre (indicatif)

L’esprit attendu : quand un écran de messagerie reste ouvert, **il se met à jour de lui-même** à l’arrivée d’un message ou d’un changement utile (liste, compteur).  
Les détails d’implémentation et de style de code sont dans [`CONVENTIONS.md`](CONVENTIONS.md) — à utiliser surtout pour la relecture de la livraison, pas comme cahier des charges produit.

## Recette locale

1. Démarrer l’application (voir [`README.md`](README.md)).
2. Se connecter via les comptes de démonstration, par exemple :
   - Sophie Martin (famille) — `/go/famille`
   - Camille Dubois (intervenant·e) — `/go/intervenant`
   - Autres comptes : Lucas Petit, Nadia Benali, Alex Bernard (`/go/observateur`, sans annonce — utile pour vérifier qu’un tiers n’ouvre pas un fil qui ne le concerne pas)
3. Tester idéalement avec **deux fenêtres** côte à côte (un compte chacun) pour vérifier les mises à jour sans rechargement.
4. Comparer le comportement à cette description, puis relire la branche `feature/MSG-42` et les conventions.
