20.times do
  user = User.create!( username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: "password")
end

40.times do
  question = Question.create!( title: Faker::Hacker.say_something_smart,
               content: Faker::Hipster.paragraph(2,true),
               user_id: rand(1..20))
end

100.times do
  answer = Answer.create!( answer: Faker::ChuckNorris.fact,
               question_id: rand(1..40),
               user_id: rand(1..20))
end
