# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
s1 = Task.create(title:"finish the CRUD", due_time: DateTime.new(2012,9,30))
s2 = Task.create(title:"start on tags", due_time: DateTime.new(2015,9,30))
t1 = Tag.create(name:'important', tasks: [s1, s2])
t2 = Tag.create(name:'urgent')
t2.update(tasks: [s1])