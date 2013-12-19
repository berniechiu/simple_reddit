class PagesController < ApplicationController
  def index
    @links = Link.all
    @newest_links = Link.newest
    @popular_links = Link.popular
  end
end
