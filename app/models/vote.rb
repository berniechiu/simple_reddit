class Vote < ActiveRecord::Base
  attr_accessible :link_id, :up

  belongs_to :link
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => :link_id }
end
