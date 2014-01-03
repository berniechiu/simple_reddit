class LinksController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def show
    @link = Link.includes(:user).find(params[:id])
    @comment = @link.comments.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(params[:link])

    if @link.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end
