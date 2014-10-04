class LinksController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def show
    @link = Link.includes(:user).find(params[:id])
    @comment = @link.comments.new
    @comments = @link.comments.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @link = Link.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @link = current_user.links.build(params[:link])

    if @link.save
      flash[:success] = "You successfully created a link."
      redirect_to root_path
    else
      @categories = Category.all.map { |c| [c.name, c.id] }
      render 'new'
    end
  end

  def feed
    @links = Link.feed

    respond_to do |format|
      format.rss { render layout: false } #feed.rss.builder
    end
  end
end
