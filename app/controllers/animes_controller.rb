class AnimesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @animes = Anime.all
    render json: @animes
  end

  def show
    @anime = Anime.find(params[:id])
    render json: @anime
  end
end
