require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  before(:each) do
    stub_authorize_user!
  end

  describe "user" do
    it "#index" do
      get :index
      expect(assigns(:questions)).to eq Question.by_vote_sum || Question.by_recency
    end

    it "#new" do
      question = Question.new
      get :new
      expect(response).to render_template(:new)
    end

    context "#update" do
      it "updates a question with valid params" do
        params = FactoryGirl.create(:question, title: 'Old title')
        expect{ put :update, id: params.id, question: {title: 'New title'}}.to change{params.reload.title}
      end
      it "doesn't update a post when params are invalid" do
        params = FactoryGirl.create(:question, title: 'Old title')
        post_edit = put :update, id: params.id, question: {title: ''}
        expect( post_edit ).to redirect_to question_path(params.id)
      end
    end

    it "#destroy" do
      question = Question.new(title: "new post", content: "A great story")
      question.save
      expect{question.destroy}.to change{Question.count}.by(-1)
    end
  end
end

