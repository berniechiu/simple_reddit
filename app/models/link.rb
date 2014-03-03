class Link < ActiveRecord::Base
  acts_as_commentable
  
  attr_accessible :title, :url

  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :url,   presence: true

  scope :newest, where('created_at > ?', 10.days.ago)
  scope :feed, select("title, url, created_at").order('created_at DESC').limit(10)

  def self.top
    self.all.sort do |a, b|
      (b.votes.where(:up => true).count - b.votes.where(:up => false).count) <=> 
      (a.votes.where(:up => true).count - a.votes.where(:up => false).count)
    end.first(6)
  end
end
