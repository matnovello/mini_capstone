# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sup = Supplier.new({ name: "house supplies mega corp", email: "supermegaconspiracycorp@gmail.com", phone_number: "8456778530" })
sup.save

ord = Order.new(user_id: 1, product_id: 23, quantity: 1)

ord.save
