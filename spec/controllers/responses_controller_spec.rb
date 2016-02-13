require 'rails_helper'

RSpec.describe ResponsesController, type: :controller do

  before(:each) do
    stub_authorize_user!
  end

  describe "user" do

    context "#create" do
      it "creates an answer with valid params" do
      question = Question.create(title: "new post", content: "A great story")
        answer = question.answers.new(content: "A great answer")
          post :create, answer

        expect(answer.save).to redirect_to question_path(question)
      end

      it "doesn't create a post when params are invalid" do
        params = {question: FactoryGirl.attributes_for(:question, content: '')}
        post :create, params
        expect(response).to redirect_to questions_path
      end
    end

    context "#update" do
      it "updates a post with valid params" do
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
      answer = Answer.new(content: "A great story")
      answer.save
      expect{answer.destroy}.to change{Answer.count}.by(-1)
    end
  end
end
