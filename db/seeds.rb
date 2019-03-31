# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
%w[lorem ipsum dolor sit amet consectetur adipiscing elit sed eiusmod tempor]\
  .each do |username|
    User.create!(
      name: username.capitalize,
      email: "#{username}@mail.org",
      password: '12345',
      level: 0
    )
  end

user_ids = User.ids

category = Category.create!(title: 'Веб-дизайн')
test = category.tests.create!(title: 'HTML', author: User.find(user_ids.sample))
question = test.questions.create!(body: 'Что такое тэг?')
question.answers.create!(body: 'команда')
question.answers.create!(body: 'элемент', correct: true)
question.answers.create!(body: 'метка', correct: true)
question = test.questions.create!(body: 'Какой тэг используется для создания ссылок?')
question.answers.create!(body: '<a>', correct: true)
question.answers.create!(body: '<b>')
question.answers.create!(body: '<i>')

category = Category.create!(title: 'Веб-программирование')
%w[Ruby Rails JavaScript Java PHP Python].each do |l|
  test = category.tests.create!(
    title: l,
    level: rand(0..3),
    author: User.find(user_ids.sample)
  )
  rand(6..10).times do |q|
    question = test.questions.create!(body: "Вопрос #{l} #{q}?")
    rand(2..Answer::MAX_NUMBER_ANSWERS).times do |a|
      question.answers.create!(body: "ответ #{a} #{l} #{q}", correct: a == 2)
    end
  end
end

category = Category.create!(title: 'Программирование')
%w[C++ Ada Fortran Perl Assembler Pascal Delphi COBOL].each do |l|
  test = category.tests.create!(
    title: l,
    level: rand(0..3),
    author: User.find(user_ids.sample)
  )
  rand(6..10).times do |q|
    question = test.questions.create!(body: "Вопрос #{l} #{q}?")
    rand(2..Answer::MAX_NUMBER_ANSWERS).times do |a|
      question.answers.create!(body: "ответ #{a} #{l} #{q}", correct: a == 2)
    end
  end
end
