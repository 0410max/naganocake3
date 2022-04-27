# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'a@a',
   password: 'qwerty'
)

Genre.create!(
   [
      {name:'ケーキ'},
      {name:'プリン'},
      {name:'焼き菓子'}
   ]
)

item = Item.create!(
      {
      name:'いちごケーキ',
      genre_id:'1',
      notax_money:'1000',
      introduction:'美味しいです',
      is_sale:true
      }
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/相模原3.jpeg')),filename: '相模原3.jpg')