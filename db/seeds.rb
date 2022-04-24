# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = Role.find_or_create_by(name: :admin)
shop_owner = Role.find_or_create_by(name: :shop_owner)
shop_employee = Role.find_or_create_by(name: :shop_employee)
bakery_shop = Shop.find_or_create_by(shopify_token: 'first_token', shopify_domain: 'bakery.shop.com', email: 'bakery_shop@gmail.com', name: "Bakery")
shoe_shop = Shop.find_or_create_by(shopify_token: 'second_token',shopify_domain: 'shoe.shop.com',email: 'shoe_shop@gmail.com', name: "Shoe")
clothes_shop = Shop.find_or_create_by(shopify_token: 'third_token',shopify_domain: 'clothes.shop.com',email: 'clothes_shop@gmail.com', name: "Clothes")
admin_user = User.create(email: 'admin@example.com', password: 'password', shop_id: bakery_shop.id)
shoe_shop_owner = User.create(email: 'shop_owner@example.com', password: 'password', shop_id: shoe_shop.id)
shoe_shop_employee = User.create(email: 'shop_employee@example.com', password: 'password', shop_id: shoe_shop.id)
admin_user.add_role :admin
shoe_shop_owner.add_role :shop_owner
shoe_shop_employee.add_role :shop_employee
email_template = EmailTemplate.find_or_create_by(
  name: "Simple Email", subject: "Referral", sender: "admin@example.com",
  recipient: "sumitbansal190@gmail.com", salutation: "Dear", email_body: "first referreal code",
  closing: "regards"
)
logo_path = Rails.root.join('app', 'assets', 'images', 'referral_logo.jpeg')
banner_path = Rails.root.join('app', 'assets', 'images', 'referral_banner.jpg')
email_template.logo.attach(io: File.open(logo_path), filename: 'referral_logo.jpeg')
email_template.banner.attach(io: File.open(banner_path), filename: 'referral_banner.jpg')
email_template1 = EmailTemplate.find_or_create_by(
  name: "Createive Email", subject: "Referral", sender: "admin@example.com",
  recipient: "sumitbansal190@gmail.com", salutation: "Dear", email_body: "first referreal code",
  closing: "regards"
)
logo_path = Rails.root.join('app', 'assets', 'images', 'referral_logo1.jpeg')
banner_path = Rails.root.join('app', 'assets', 'images', 'referral_banner1.jpeg')
email_template1.logo.attach(io: File.open(logo_path), filename: 'referral_logo1.jpeg')
email_template1.banner.attach(io: File.open(banner_path), filename: 'referral_banner1.jpeg')
email_template2 = EmailTemplate.find_or_create_by(
  name: "Creative Email", subject: "Referral", sender: "admin@example.com",
  recipient: "sumitbansal190@gmail.com", salutation: "Dear", email_body: "first referreal code",
  closing: "regards"
)
logo_path = Rails.root.join('app', 'assets', 'images', 'referral_logo2.png')
banner_path = Rails.root.join('app', 'assets', 'images', 'referral_banner2.gif')
email_template2.logo.attach(io: File.open(logo_path), filename: 'referral_logo2.png')
email_template2.banner.attach(io: File.open(banner_path), filename: 'referral_banner2.gif')
