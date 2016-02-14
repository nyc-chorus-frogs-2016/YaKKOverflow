class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :responses, as: :respondable
  has_many :votes, as: :votable

  def editable_by? user
    self.user == user
  end

  def vote_sum
    Vote.where("votable_type = ? AND votable_id =?", "Answer", self.id).pluck("value").inject(0){|sum,x| sum + x }
  end

  def already_voted?(user_id)
    !Vote.where("votable_type = ? AND user_id = ? AND votable_id = ?", "Answer", user_id, self.id).empty?
  end

  def answer_up_or_down_vote(user_id)
    if Vote.where("votable_type = ? AND user_id = ? AND votable_id = ?", "Answer", user_id, self.id)[0].value == 1
      return "up"
    else
      return "down"
    end
  end

  def mark_as_best_answer(direction)
    if direction == true && self.question.has_best_answer ==0
      self.is_best_answer = 1
      self.question.has_best_answer = 1
    elsif direction == false
      self.is_best_answer = 0
      self.question.has_best_answer = 0
    end
  end

end
