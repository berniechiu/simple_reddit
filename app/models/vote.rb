class Vote < ActiveRecord::Base
  attr_accessible :link_id, :up

  belongs_to :link, counter_cache: :up_votes_count
  belongs_to :link, counter_cache: :down_votes_count
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => :link_id }
end
