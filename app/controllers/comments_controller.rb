class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def create
    @link = Link.find(params[:id])
    @comment = @link.comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back
    else
      redirect_to :back, notice: "Please Fill Out Your Comment Properly!"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to :back
  end
end