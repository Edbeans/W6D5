# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#rails db:seed

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')


users = User.create([
    { username: "edbeans" },
    { username: "ahjung" },
    { username: "jonaswood" },
    { username: "xXChrisTheCodeSlayerXx"},
    { username: "EricChen" },
    { username: "larrygagosian" },
    { username: "davidzwirner" }
])


artworks = Artwork.create([
    { title: "Marilyn Monroe Print (2010)" , image_url: "marliyn" , artist_id: 1 },
    { title: "Banana Colourized(2020)" , image_url: "banana" , artist_id: 2 },
    { title: "Dog Eating Dog Lithograph (1990)" , image_url: "dog" , artist_id: 3 },
    { title: "Bored Ape NFT #14 (2021)" , image_url: "boredape" , artist_id: 3 },
    { title: "Santa Claus in Madagascar", image_url: "santa", artist_id: 4 },
    { title: "Monkey Loves You", image_url: "monkeylove", artist_id: 5 },
    { title: "Monkey Hates You", image_url: "monkeyhate", artist_id: 6 },
    { title: "Waves of Kanagawa", image_url: "waves", artist_id: 7 }
])

artwork_shares = ArtworkShare.create([
    { viewer_id: 1, artwork_id: 1 },
    { viewer_id: 1, artwork_id: 2 },
    { viewer_id: 1, artwork_id: 3 },
    { viewer_id: 1, artwork_id: 4 },
    { viewer_id: 1, artwork_id: 5 },
    { viewer_id: 1, artwork_id: 6 },
    { viewer_id: 1, artwork_id: 7 },
    { viewer_id: 2, artwork_id: 2 },
    { viewer_id: 2, artwork_id: 3 },
    { viewer_id: 2, artwork_id: 4 },
    { viewer_id: 2, artwork_id: 5 },
    { viewer_id: 2, artwork_id: 6 },
    { viewer_id: 3, artwork_id: 1 },
    { viewer_id: 3, artwork_id: 2 },
    { viewer_id: 3, artwork_id: 3 },
    { viewer_id: 3, artwork_id: 4 },
    { viewer_id: 4, artwork_id: 5 },
    { viewer_id: 4, artwork_id: 6 },
    { viewer_id: 4, artwork_id: 7 },
    { viewer_id: 5, artwork_id: 1 },
    { viewer_id: 5, artwork_id: 2 },
    { viewer_id: 6, artwork_id: 3 },
    { viewer_id: 6, artwork_id: 4 },
    { viewer_id: 7, artwork_id: 5 },
    { viewer_id: 7, artwork_id: 6 }
])