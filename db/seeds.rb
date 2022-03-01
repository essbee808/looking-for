# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.where(email: "love.to.code.17@gmail.com").blank?
    User.create!(email: "love.to.code.17@gmail.com", password: "superpassword", name: "SuperAdmin", admin: true)
end

Category.create(name: "Money Management")
Category.create(name: "Education")
Category.create(name: "Employment")
Category.create(name: "Housing")
Category.create(name: "Health/Medical")

Program.create(name: "Volunteer Match", website: "https://www.volunteermatch.org/", 
    description: "VolunteerMatch matches inspired people with inspiring causes. It's how volunteers and nonprofits connect to achieve remarkable outcomes.", 
    category_id: 3, creator_id: 1)