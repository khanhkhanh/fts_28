User.delete_all

User.create!(email: "admin@gmail.com",
             password: "adminadmin",
             password_confirmation: "adminadmin",
             admin: true)

User.create!(email: "khanhkhanh@gmail.com",
             password: "khanhkhanh",
             password_confirmation: "khanhkhanh",
             admin: false)

48.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@tms.org"
  password = "password"
  User.create!(email: email,
              password: password,
              password_confirmation: password,
              admin: false)
end
