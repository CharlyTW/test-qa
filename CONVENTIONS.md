# Conventions — Cocon

Extrait des bonnes pratiques attendues sur ce dépôt (inspirées d’un monorepo Rails réel).

## Controllers

- Controllers **minces** : auth, chargement, appel au form/service, rendu / redirect.
- Pas de validation métier ni de persistance complexe dans le controller.
- Passer les données aux vues via `locals:` (éviter de lire des `@variables` dans les templates).

## Forms (Reform)

- Les validations et l’orchestration `save` vivent dans un form object (`app/forms/...`).
- Le controller appelle `form.validate(params)` puis `form.save`.

## Vues

- Slim préféré pour les pages.
- Mises à jour interactives de la messagerie : **Turbo Streams** / **Turbo Broadcasts**.
- Pas de JS inline ni de CSS inline.

## RSpec

- `require "rails_helper"`.
- Au moins un `expect(...).to` réel par example.
- Doubles **vérifiés** uniquement : `instance_double` / `class_double`.
- **Jamais** de `double` nu.
- **Jamais** stubber le subject de l’example.
- Couvrir les branches métier importantes (permissions, unread, archive, streams).

## Auth de démo

- `GET /go/:slug` pose la session (pas de mot de passe).
- Ne pas inventer Devise pour cet exercice.
