# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  #User.create([{name: 'Martin', email: 'martin28@dog.com'}, {name: 'Petunia', email: 'petuniaisthebest@gmail.com'}])
  User.create([
    {username: 'Martin'},
    {username: 'Petunia'},
    {username: 'Oreo'},
    {username: 'Poptart'},
    {username: 'CornNut'}
    ])

  Artwork.create([
    {title: 'Masterpiece', img_url: 'masterpiece.com', artist_id: 1},
    {title: 'double fudge', img_url: 'cookie.net', artist_id: 3},
    {title: 'cinnamon sugar', img_url: 'pastries.io', artist_id: 4},
    {title: 'ranch', img_url: 'nut.gov', artist_id: 5},
    {title: 'always hungry', img_url: 'meows@5am.party', artist_id: 2}
  ])
  
  ArtworkShare.create([
    {artwork_id: 4, viewer_id: 5},
    {artwork_id: 2, viewer_id: 4},
    {artwork_id: 3, viewer_id: 2},
    {artwork_id: 5, viewer_id: 3},
    {artwork_id: 1, viewer_id: 1}
  ])
