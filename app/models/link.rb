class Link < ActiveRecord::Base
  attr_accessible :title, :url

  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :url,   presence: true

  scope :newest, where('created_at > ?', 10.days.ago)

  def self.top
    self.includes(:votes).all.sort do |a, b|
      (b.votes.where(:up => true).count - b.votes.where(:up => false).count) <=> 
      (a.votes.where(:up => true).count - a.votes.where(:up => false).count)
    end
  end
end
