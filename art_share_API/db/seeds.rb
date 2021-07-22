# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

davinci = User.create(username: "davinci")
quinn = User.create(username: "quinn")
amin = User.create(username: "amin")
tahj = User.create(username: "tahj")
greta = User.create(username: "greta")


monalisa = Artwork.create(title: "monalisa", image_url: "monalisa.com", artist_id: davinci.id)
last_supper = Artwork.create(title: "last supper", image_url: "lastsupper.com", artist_id: davinci.id)
landscape = Artwork.create(title: "landscape", image_url: "landscape.com", artist_id: greta.id)


ArtworkShare.create(artwork_id: monalisa.id, viewer_id: greta.id)
ArtworkShare.create(artwork_id: last_supper.id, viewer_id: greta.id)


