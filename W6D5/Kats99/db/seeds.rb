# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Cat.create([{birth_date: '2000/1/20', color:'Green', name:'Martin', sex: 'M', description: 'hi, me Martin'},
  {birth_date: '2007/6/13', color:'White', name:'Bart', sex: 'M', description: 'Hello'},
  {birth_date: '2020/12/31', color:'Rainbow', name:'Oreo', sex: 'F', description: 'hej, im oreo.'},
  {birth_date: '2021/2/26', color:'Yellow', name:'Kevin', sex: 'F', description: 'Baller'}])
