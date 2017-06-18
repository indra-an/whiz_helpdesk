# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Superadmin.find_by_email("superadmin@mail.com").blank?
  puts "Seeding Superadmin..."
  [
    { email: "superadmin@mail.com", password: "123456789", first_name: "Superadmin", last_name: "Helpdesk" }
  ].each { |admin| Superadmin.create(admin) }
end
