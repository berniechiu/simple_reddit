class VideosController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @video = Video.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @video = current_user.videos.build(params[:video])

    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      @categories = Category.all.map { |c| [c.name, c.id] }
      render 'new'
    end
  end
end
