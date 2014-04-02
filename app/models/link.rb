class Link < ActiveRecord::Base
  acts_as_commentable

  attr_accessible :title, :url, :category_id

  belongs_to :user
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :up_votes, class_name: 'Vote', conditions: { up: true }
  has_many :down_votes, class_name: 'Vote', conditions: { up: false }

  validates :title, presence: true
  validates :url,   presence: true

  scope :newest, where('created_at > ?', 10.days.ago)
  scope :feed, select("title, url, created_at").order('created_at DESC')
                                               .limit(10)

  def self.top
    self.all.sort do |a, b|
      # Compare it from highest value to lowest value
      (b.up_votes.length - b.down_votes.length) <=>
      (a.up_votes.length - a.down_votes.length)
    end.first(6)
  end
end
