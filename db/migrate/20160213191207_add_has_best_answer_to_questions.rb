class AddHasBestAnswerToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :has_best_answer, :integer
  end
end
