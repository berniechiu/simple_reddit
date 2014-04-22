class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :links
  has_many :videos
end
