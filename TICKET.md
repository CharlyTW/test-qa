# MSG-42 — Messagerie temps réel entre famille et intervenant

**Type :** Feature  
**Produit :** Cocon  
**Branche :** `feature/MSG-42`

## Contexte

Les familles et les intervenant·es doivent pouvoir échanger depuis une fiche d’annonce, avec une inbox et un fil de discussion. Les mises à jour passent par **Turbo Streams / Turbo Broadcasts** (pas de refresh manuel pour voir un nouveau message dans un fil ouvert).

## Écrans

1. **Fiche annonce** — bouton « Contacter » (si ce n’est pas ma propre annonce).
2. **Inbox** — `/conversations` (fils, badge non-lus, empty state, archiver).
3. **Fil** — `/conversations/:id` (historique + composer).

## Critères d’acceptation

1. Connecté, je démarre un fil depuis la fiche de B — **pas** depuis la mienne.
2. J’envoie un texte : il s’affiche chez moi tout de suite ; **B le voit arriver sans recharger** la page.
3. Inbox : plus récent en premier ; **empty state** dédié quand il n’y a aucun fil.
4. Badge non-lu côté B se met à jour à l’arrivée du message ; ouvrir le fil le remet à zéro.
5. J’archive : le fil disparaît de **mon** inbox, B le voit encore. Un nouveau message de B **le réaffiche chez moi** (archiver ≠ bloquer), y compris en live si mon inbox est ouverte.

## Hors périmètre

- Pièces jointes
- E-mails / notifications push
- Modération IA / dictionnaires
- Pass / quotas
- « Bloquer un utilisateur »
- Temps réel via un service externe autre qu’ActionCable local

## Notes

- Comptes de démo : `/go/famille`, `/go/intervenant`.
- Recette attendue en **deux onglets** côte à côte.
