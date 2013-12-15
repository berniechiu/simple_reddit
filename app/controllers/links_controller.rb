class LinksController < ApplicationController
  def show
    @link = Link.find(params[:id])
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
