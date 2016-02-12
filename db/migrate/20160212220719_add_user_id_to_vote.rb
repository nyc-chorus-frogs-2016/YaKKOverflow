class AddUserIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :use_id, :integer
  end
end
