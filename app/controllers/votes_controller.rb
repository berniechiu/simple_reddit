class VotesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def vote_up
  end

  def vote_down
  end
end
