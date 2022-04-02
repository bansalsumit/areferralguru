# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
include Sprig::Helpers

sprig [Role, User]
user = User.find_by(email: 'admin@example.com')
user.add_role :admin
user = User.find_by(email: 'shop_owner@example.com')
user.add_role :shop_owner
user = User.find_by(email: 'shop_employee@example.com')
user.add_role :shop_employee
