class AddIndexToUserIdAndLinkIdToVotes < ActiveRecord::Migration
  def change
    add_index :votes, [:link_id, :user_id], unique: true
  end
end
