class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  def editable_by? user
    creator == user
  end

end
