# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


#users
david = User.create!(username: "David")
josh = User.create!(username: "Josh")
andy = User.create!(username: "Andy")
valerie = User.create!(username: "Valerie")


# artworks

artwork1 = Artwork.create!(title: "Monalisa", image_url: "monalisa.com", artist_id: david.id)
artwork2 = Artwork.create!(title: "Apple", image_url: "apple.com", artist_id: josh.id)
artwork3 = Artwork.create!(title: "flower", image_url: "flower.com", artist_id: valerie.id)

#artwork_share

as1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: josh.id)
as2 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: andy.id)
as3 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: david.id)
as4 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: valerie.id)