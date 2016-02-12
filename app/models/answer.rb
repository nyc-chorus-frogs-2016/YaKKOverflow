class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :responses, as: :respondable
  has_many :votes, as: :votable

  def editable_by? user
    self.user == user
  end

end
