class VotesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def create
    if current_user.votes.where(link_id: params[:vote][:link_id]).present?
      vote = current_user.votes.where(:link_id => params[:vote][:link_id]).first
      vote.update_attributes(params[:vote])
    else
      vote = current_user.votes.create(params[:vote])
      vote.save!
    end

    redirect_to root_path
  end
end