User.delete_all

User.create!(email: 'framgia.test.app.28@gmail.com',
             password: '08011992',
             password_confirmation: '08011992',
             admin: true)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@fts.28.com"
  password = "password"
  User.create!(email: email,
              password: password,
              password_confirmation: password,
              admin: false)
end

5.times do |n|
  name = "Category #{n+1}"
  Category.create!(name: name)
end

categories = Category.all
30.times do |n|
  content = "Question #{n+1}"
  categories.each {|category| category.questions.create! content: content}
end

questions  = Question.order(:created_at).all
4.times do |n|
  content = "Answer #{n+1}"
  questions.each {|question| question.answers.create! content: content, correct: n == 1}
end
