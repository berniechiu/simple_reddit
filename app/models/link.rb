class Link < ActiveRecord::Base
  attr_accessible :title, :url

  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :url,   presence: true

  scope :newest, where('created_at > ?', 10.days.ago)
  scope :popular, where('created_at < ?', 10.days.ago)
end
