class PagesController < ApplicationController
  def index
    @all_categories = Category.all

    @newest_links = Link.includes(:votes)
                        .newest
                        .paginate(:page => params[:page], :per_page => 8)
    @popular_links = Link.includes(:category, :votes).top

    @videos = Video.recent

    categories_filter
  end

  private

    def categories_filter
      session[:categories] = params[:categories]

      if session[:categories]

        @categories = session[:categories]
        @categories = @categories.values if @categories.respond_to?(:values)
        @links = Link.includes(:category)
                     .find(:all,
                           conditions: ["category_id IN (?)", @categories])
      end

      if session[:categories] != params[:categories]
        redirect_to root_path(categories: session[:categories])
      end
    end
end
