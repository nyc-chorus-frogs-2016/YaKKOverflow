class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :answers

  def self.by_votes
     # tdb
  end

  def self.by_recency
    order(created_at: :desc)
  end

  def editable_by? user
    creator == user
  end

end
