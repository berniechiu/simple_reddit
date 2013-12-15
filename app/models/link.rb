class Link < ActiveRecord::Base
  attr_accessible :title, :url
  belongs_to :user
  validates :title, presence: true
  validates :url,   presence: true
end
