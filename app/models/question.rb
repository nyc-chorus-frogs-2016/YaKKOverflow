class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :responses, as: :respondable
  has_many :answers
  has_many :votes, as: :votable

  def self.by_vote_sum
    all.to_a.sort_by(&:vote_sum).reverse
  end


  def self.by_recency
    order(created_at: :desc)
  end

  def editable_by? user
    creator == user
  end

  def vote_sum
    Vote.where("votable_type = ? AND votable_id =?", "Question", self.id).pluck("value").inject(0){|sum,x| sum + x }
  end

  def already_voted?(user_id)
    !Vote.where("votable_type = ? AND user_id = ? AND votable_id = ?", "Question", user_id, self.id).empty?
  end

  def question_up_or_down_vote(user_id)
    if Vote.where("votable_type = ? AND user_id = ? AND votable_id = ?", "Question", user_id, self.id)[0].value == 1
      return "up"
    else
      return "down"
    end
  end

end
