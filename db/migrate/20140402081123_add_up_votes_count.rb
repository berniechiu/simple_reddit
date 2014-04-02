class AddUpVotesCount < ActiveRecord::Migration
  def up
    add_column :links, :up_votes_count, :integer, default: 0

    Link.reset_column_information
    Link.all.each do |link|
      link.update_attribute :up_votes_count, link.up_votes.length
    end
  end

  def down
    remove_column :links, :up_votes_count
  end
end
