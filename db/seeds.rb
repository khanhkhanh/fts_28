User.create!(email: 'framgia.test.app.28@gmail.com',
             password: '08011992',
             password_confirmation: '08011992',
             admin: true)

User.create!(email: "admin@gmail.com",
             password: "adminadmin",
             password_confirmation: "adminadmin",
             admin: true)

User.create!(email: "khanhkhanh@gmail.com",
             password: "khanhkhanh",
             password_confirmation: "khanhkhanh",
             admin: false)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@fts.28.com"
  password = "password"
  User.create!(email: email,
              password: password,
              password_confirmation: password,
              admin: false)

Category.create!(name: "MySQL")
Category.create!(name: "Git")
Category.create!(name: "Ruby on Rails")

_MySQLQuestions = Category.find(1).questions
3.times do |n|
  content = "MySQL'sAnswer#{n+1}"
  _MySQLQuestions.each {|question| question.answers.create! content: content, correct: n == 1}
end

_GitQuestions = Category.find(2).questions
3.times do |n|
  content = "Git'sAnswer#{n+1}"
  _GitQuestions.each {|question| question.answers.create! content: content, correct: n == 1}
end

_RubyOnRailsQuestions = Category.find(3).questions
3.times do |n|
  content = "RubyOnRails'Answer#{n+1}"
  _RubyOnRailsQuestions.each {|question| question.answers.create! content: content, correct: n == 1}
end
