class AddDownVotesCount < ActiveRecord::Migration
  def up
    add_column :links, :down_votes_count, :integer, default: 0

    Link.reset_column_information
    Link.all.each do |link|
      link.update_attribute :down_votes_count, link.down_votes.length
    end
  end

  def down
    remove_column :links, :down_votes_count
  end
end
