class Video < ActiveRecord::Base
  attr_accessible :author, :dislikes, :duration, :likes, :link, :title
end
