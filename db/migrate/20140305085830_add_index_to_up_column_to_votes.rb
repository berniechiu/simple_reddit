class AddIndexToUpColumnToVotes < ActiveRecord::Migration
  def change
    add_index :votes, :up
  end
end
