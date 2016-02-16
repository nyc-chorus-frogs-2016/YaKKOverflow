require 'rails_helper'

describe SessionsController do

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user }
    it "redirects to root path if correct credentials" do
      post :create, :username => user.username, :password => user.password
      expect(response).to redirect_to questions_path
    end
  end
end
