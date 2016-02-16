require 'rails_helper'

RSpec.describe Question, type: :model do

  it "should be able to be sorted by when it was created" do
    question1 = Question.create(title: "new question", content: "A great story")
    question2 = Question.create(title: "new question 2", content: "A greater story")

    expect(Question.order('created_at desc').all).to eq [question2, question1]
  end
end


