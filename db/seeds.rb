kristie = User.create!({password: "123", uid: "Kristie", provider: "yakkoverflow", name: "Kristie Chow"})
kb = User.create!({password: "123", uid: "KB", provider: "yakkoverflow", name: "Kaybi"})
yi = User.create!({password: "123", uid: "yilu1021", provider: "yakkoverflow", name: "Yi Lu"})
users = User.all


["ruby", "javascript", "general", "databases", "random"].each do |tag|
  Tag.create!({ name: tag })
end

tags = Tag.all


5.times do
  Question.create!({
    title: "#{Faker::Hacker.ingverb}?",
    content: "#{Faker::Hacker.say_something_smart}?",
    creator: users.sample,
    has_best_answer: 0,
  })
end

questions = Question.all

10.times do 
  q = questions.sample
  q.tags.push(tags.sample)
end

20.times do
  Answer.create!({
    content: Faker::Hacker.say_something_smart,
    user: users.sample,
    question: questions.sample,
    is_best_answer: 0
  })
end

answers = Answer.all

20.times do
  Response.create!({
    content: Faker::Hacker.say_something_smart,
    user: users.sample,
    respondable_type: "Question",
    respondable_id: questions.sample.id
    })
end

20.times do
  Response.create!({
    content: Faker::Hacker.say_something_smart,
    user: users.sample,
    respondable_type: "Answer",
    respondable_id: answers.sample.id
    })
end