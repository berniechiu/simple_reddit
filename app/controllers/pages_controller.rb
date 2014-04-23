class PagesController < ApplicationController
  def index
    @newest_links = Link.includes(:votes)
                        .newest
                        .paginate(:page => params[:page], :per_page => 8)
    @popular_links = Link.includes(:category, :votes).top

    @videos = Video.recent
  end
end
