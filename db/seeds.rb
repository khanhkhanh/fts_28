User.create!(email: "framgia.test.app.28@gmail.com",
             password: "08011992",
             password_confirmation: "08011992",
             admin: true)

49.times do |n|
  email = "example-#{n+1}@fts.28.com"
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               admin: false)
end

Category.create!(name: "MySQL")
Category.create!(name: "Git")
Category.create!(name: "Ruby on Rails")

categories = Category.all
30.times do |n|
  content = "Question #{n+1}"
  categories.each {|category| category.questions.create! content: content}
end

_MySQLQuestions = Category.find(1).questions
4.times do |n|
  content = "MySQL Answer #{n+1}"
  _MySQLQuestions.each {|question| question.answers.create! content: content, correct: n == 1}
end

_GitQuestions = Category.find(2).questions
4.times do |n|
  content = "Git Answer #{n+1}"
  _GitQuestions.each {|question| question.answers.create! content: content, correct: n == 1}
end

_RubyOnRailsQuestions = Category.find(3).questions
4.times do |n|
  content = "RubyOnRails Answer #{n+1}"
  _RubyOnRailsQuestions.each {|question| question.answers.create! content: content, correct: n == 1}
end
