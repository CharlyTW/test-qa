# frozen_string_literal: true

famille = Account.find_or_create_by!(slug: "famille") do |account|
  account.display_name = "Famille Martin"
end
famille.create_listing!(
  title: "Recherche intervenant·e à domicile",
  body: "Famille avec deux enfants, quartier calme."
) unless famille.listing

intervenant = Account.find_or_create_by!(slug: "intervenant") do |account|
  account.display_name = "Camille Intervenant"
end
intervenant.create_listing!(
  title: "Camille — aide à domicile",
  body: "Disponible en semaine, expériences petite enfance."
) unless intervenant.listing
