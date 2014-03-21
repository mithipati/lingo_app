# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Group.create(name: 'MakerSquare', description: 'A boot camp for full stack developers')
Group.create(name: 'DevHouse', description: 'A house for aspiring developers')
Group.create(name: 'Austin on Rails', description: 'An awesome meetup for Ruby on Rails')
Group.create(name: 'MKS Brazzos', description: 'MKS students at the Brazzos office')
Group.create(name: 'Cali Students', description: 'Cali, enough said')

Word.create(name: 'Interesting', definition: 'An overused word by a particular teacher', group_id: 1)
Word.create(name: 'Rubber Ducky', definition: 'A new way of life', group_id: 1)
Word.create(name: 'Neon Pants', definition: "Apparently they're in again", group_id: 1)
Word.create(name: 'Beards', definition: "@user != coder unless @user.beard = true", group_id: 1)
Word.create(name: 'Apple TV', definition: "It just doesn't work", group_id: 2)
