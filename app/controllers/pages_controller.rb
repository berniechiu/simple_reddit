class PagesController < ApplicationController
  def index
    @newest_links = Link.newest
    @popular_links = Link.popular
  end
end
