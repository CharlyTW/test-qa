# frozen_string_literal: true

def upsert_account!(slug:, first_name:, last_name:, role:)
  account = Account.find_or_initialize_by(slug: slug)
  account.assign_attributes(first_name: first_name, last_name: last_name, role: role)
  account.save!
  account
end

def upsert_listing!(account, title:, body:)
  listing = account.listing || account.build_listing
  listing.assign_attributes(title: title, body: body)
  listing.save!
  listing
end

sophie = upsert_account!(
  slug: "famille",
  first_name: "Sophie",
  last_name: "Martin",
  role: "famille"
)
upsert_listing!(
  sophie,
  title: "Recherche intervenant·e à domicile — 2 enfants (3 et 6 ans)",
  body: <<~TEXT.strip
    Bonjour,

    Nous cherchons une personne de confiance pour accompagner nos deux enfants
    (3 et 6 ans) à domicile, à Lyon 3e, idéalement du lundi au jeudi.

    Besoins principaux :
    - Sortie d’école / garderie vers 16h30
    - Goûter, jeux calmes, aide aux devoirs du CP
    - Ponctuellement un mercredi matin

    Expérience petite enfance appréciée. Nous privilégions la régularité et une
    communication simple via la messagerie Cocon.
  TEXT
)

camille = upsert_account!(
  slug: "intervenant",
  first_name: "Camille",
  last_name: "Dubois",
  role: "intervenant"
)
upsert_listing!(
  camille,
  title: "Aide à domicile & garde d’enfants — dispo en semaine",
  body: <<~TEXT.strip
    Bonjour,

    Intervenant·e à domicile depuis 5 ans, je propose de la garde d’enfants et de
    l’aide au quotidien pour les familles de l’agglomération lyonnaise.

    Points forts :
    - Petite enfance (0–6 ans) et aide aux devoirs primaire
    - Disponibilités : lundi–vendredi, horaires flexibles
    - Déplacements en transports en commun (zones A/B)

    N’hésitez pas à me contacter depuis cette annonce pour préciser vos besoins
    (horaires, âge des enfants, fréquence).
  TEXT
)

# Third party with no listing — non-participant access checks (criterion 6).
upsert_account!(
  slug: "observateur",
  first_name: "Alex",
  last_name: "Bernard",
  role: "famille"
)

lucas = upsert_account!(
  slug: "famille-petit",
  first_name: "Lucas",
  last_name: "Petit",
  role: "famille"
)
upsert_listing!(
  lucas,
  title: "Garde périscolaire — enfant de 8 ans (Villeurbanne)",
  body: <<~TEXT.strip
    Bonjour,

    Parent solo, je recherche une aide pour mon fils de 8 ans sur Villeurbanne :
    récupération à l’école le soir, goûter, et présence jusqu’à ~19h deux à trois
    soirs par semaine.

    Profil recherché : ponctualité, gentillesse, et aisance avec le primaire.
    Première prise de contact uniquement via Cocon, merci.
  TEXT
)

nadia = upsert_account!(
  slug: "intervenant-benali",
  first_name: "Nadia",
  last_name: "Benali",
  role: "intervenant"
)
upsert_listing!(
  nadia,
  title: "Intervenante à domicile — soirées et week-ends",
  body: <<~TEXT.strip
    Bonjour,

    Je propose mon aide aux familles pour la garde d’enfants et le soutien du
    quotidien, surtout en soirée et le week-end.

    Expérience :
    - Garde d’enfants 2–12 ans
    - Repas simples, coucher, activités calmes
    - Secteur Lyon / Caluire / Villeurbanne

    Disponible pour des missions régulières ou ponctuelles. Contactez-moi depuis
    l’annonce pour voir si nos horaires correspondent.
  TEXT
)
