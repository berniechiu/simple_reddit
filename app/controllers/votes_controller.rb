class VotesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def create
    votes = current_user.votes.where(link_id: params[:vote][:link_id])

    if votes.present?
      vote = votes.first
      vote.update_attributes(params[:vote])
    else
      current_user.votes.create(params[:vote])
    end

    redirect_to root_path
  end
end