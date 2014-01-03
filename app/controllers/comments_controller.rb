class CommentsController < ApplicationController
  def create
    @link = @link = Link.find(params[:id])
    @comment = @link.comments.new(params[:comment])

    if @comment.save
      redirect_to link_path(@link)
    else
      render 'links/show'
    end
  end

  def delete; end
end