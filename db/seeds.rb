# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'aaa@aaa',
   password: 'qwerty'
)

Genre.create!(
   {name:'焼き菓子'},
   {name:'キャンディ'}
)

Item.create!{
   {
   name:'いちごケーキ',
   notax_money:'1000',
   introduction:'美味しいです',
   is_sale:true
   }
}