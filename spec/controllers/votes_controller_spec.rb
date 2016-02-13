require 'rails_helper'

RSpec.describe VotesController, type: :controller do

 describe "user " do

  context "#create" do
      it "can create an upvote/downvote" do
        vote = Vote.new(value: 1, votable_type: 'Question')
        expect{vote.save}.to change{Vote.count}.by(1)
      end
  end
end
end
