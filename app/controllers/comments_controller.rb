class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def create
    @link = @link = Link.find(params[:id])
    @comment = @link.comments.new(params[:comment])

    if @comment.save
      redirect_to link_path(@link)
    else
      redirect_to link_path(@link), notice: "There is something wrong with your comment!"
    end
  end

  def destroy; end
end