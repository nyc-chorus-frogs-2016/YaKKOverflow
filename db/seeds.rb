 # FIRST SEEDS

kristie = User.create!({password: "123", username: "Kristie"})
kb = User.create!({password: "123", username: "KB"})
yi = User.create!({password: "123", username: "yilu1021"})

users = User.all



20.times do
  Question.create!({
    title: "#{Faker::Hacker.ingverb}?",
    content: "#{Faker::Hacker.say_something_smart}?",
    creator: users.sample
  })
end

questions = Question.all

200.times do
  Answer.create!({
    content: Faker::Hacker.say_something_smart,
    user: users.sample,
    question: questions.sample
  })
end
