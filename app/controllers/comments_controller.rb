class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def create
    @link = Link.find(params[:id])
    @comment = @link.comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      send_message(current_user, link_path(@link)) if current_user == @comment.user
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

  private

  def send_message(user, url)
    data = Multimap.new
    data[:from] = "Simple Reddit <service@berniechiu.com>"
    data[:to] = user.email
    data[:subject] = "You Have New Comment!"
    data[:html] = "<html>Please visit the link at <a href='http://#{request.host_with_port + url}'>SIMPLE REDDIT</a>!!</html>"
    RestClient.post "https://api:#{Setting.mailgun_api_key}"\
    "@api.mailgun.net/v2/sandbox49317.mailgun.org/messages", data
  end
end