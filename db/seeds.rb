 # FIRST SEEDS

kristie = User.create!({password: "123", uid: "Kristie", provider: "yakkoverflow", name: "Kristie Chow"})
kb = User.create!({password: "123", uid: "KB", provider: "yakkoverflow", name: "Kaybi"})
yi = User.create!({password: "123", uid: "yilu1021", provider: "yakkoverflow", name: "Yi Lu"})

users = User.all



20.times do
  Question.create!({
    title: "#{Faker::Hacker.ingverb}?",
    content: "#{Faker::Hacker.say_something_smart}?",
    creator: users.sample,
    has_best_answer: 0
  })
end

questions = Question.all

200.times do
  Answer.create!({
    content: Faker::Hacker.say_something_smart,
    user: users.sample,
    question: questions.sample,
    is_best_answer: 0
  })
end
