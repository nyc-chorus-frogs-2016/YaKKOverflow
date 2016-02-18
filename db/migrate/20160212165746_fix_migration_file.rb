class FixKristiesShit < ActiveRecord::Migration
  def change
    add_column :answers, :question_id, :integer
    add_column :answers, :user_id, :integer
  end
end
