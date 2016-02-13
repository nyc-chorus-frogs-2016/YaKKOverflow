require 'rails_helper'

feature 'User browsing the website' do

  before(:each) do
    @test_question = FactoryGirl.create(:question)
  end

  context "on homepage" do
    it "sees a list of questions" do
      visit questions_path
      expect(page).to have_content(@test_question.title)
    end

    it "can click on questions should be on the question show page" do
      visit questions_path
      click_link(@test_question.title)
      expect(page.current_path).to eq(question_path(@test_question))
    end
  end

  context "question show page" do
    it "sees title and content of the question" do
      visit question_path(@test_question)
      expect(page).to have_content(@test_question.title)
      expect(page).to have_content(@test_question.content)
    end


     it "sees title and content of the question" do
      a1 = FactoryGirl.create(:answer)
      a2 = FactoryGirl.create(:answer)
      a3 = FactoryGirl.create(:answer)
      visit question_path(@test_question)
      expect(page).to have_content(a1.content)
      expect(page).to have_content(a2.content)
      expect(page).to have_content(a3rsp.content)
    end

  end
end
