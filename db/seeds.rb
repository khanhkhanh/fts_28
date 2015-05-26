User.create!(email: "admin@gmail.com",
             password: "adminadmin",
             password_confirmation: "adminadmin",
             admin: true)

User.create!(email: "khanhkhanh@gmail.com",
             password: "khanhkhanh",
             password_confirmation: "khanhkhanh",
             admin: false)

Category.create!(name: "MySQL")
Category.create!(name: "Git")
Category.create!(name: "Ruby on Rails")

15.times do |n|
  content = "MySQL#{n+1}"
  Category.find(1).questions.create! content: content
end

15.times do |n|
  content = "Git#{n+1}"
  Category.find(2).questions.create! content: content
end

15.times do |n|
  content = "RubyOnRails#{n+1}"
  Category.find(3).questions.create! content: content
end

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
