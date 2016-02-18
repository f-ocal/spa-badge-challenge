class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

  def index
    @votes = Vote.where(badge_id: params[:badge_id])
    render json: @votes
  end

  def show
    render json: @vote
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.badge_id = params[:badge_id]
    if @vote.save
      render json: @vote, status: :created
    else
      display_error
    end
  end

  private
  def vote_params
    params.permit(:vote_type)
  end

  def display_errors
    render json: @vote.errors, status: :unprocessable_entity
  end
end
