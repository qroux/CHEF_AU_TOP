# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.destroy_all
User.destroy_all



User.create!(email: "mary@gmail.com", password: "azerty123", first_name: "mary", last_name: "acard")
User.create!(email: "louise@gmail.com", password: "azerty123", first_name: "louise", last_name: "grosgogeat")
User.create!(email: "milena@gmail.com", password: "azerty123", first_name: "milena", last_name: "gaigne")
User.create!(email: "quentin@gmail.com", password: "azerty123", first_name: "quentin", last_name: "roux")


Service.create!(menu: "Boeuf de Kobe, Otoro, Mochi", price: 45, max_quantity: 5, picture: (Rails.root.join("app/assets/images/sushi.jpg").open), category: "japonais", date: "Mon, 25 Feb 2019", shift: "soir", user: User.all.sample, menu_name: "Delices japonais")
Service.create!(menu: "Assortiment de mezze", price: 45, max_quantity: 5, picture: (Rails.root.join("app/assets/images/libanais.jpg").open), category: "libanais", date: "Mon, 25 Feb 2019", shift: "soir", user: User.all.sample, menu_name: "Delices libanais")
