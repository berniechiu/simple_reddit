class Vote < ActiveRecord::Base
  attr_protected :link_id, :user_id

  belongs_to :link
  belongs_to :user
end
