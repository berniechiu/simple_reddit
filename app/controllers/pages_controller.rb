class PagesController < ApplicationController
  def index
    @newest_links = Link.includes(:votes).newest
    @popular_links = Link.top
  end
end
