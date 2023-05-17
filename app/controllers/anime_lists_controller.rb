class AnimeListsController < ApplicationController

  def index
    anime_lists = AnimeList.all
    render json: anime_lists
  end

  def show
    anime_list = AnimeList.find(params[:id])
  end

  def create
    anime_list = AnimeList.create(anime_list_params)   
    if anime_list.valid?
      render json: anime_list
    else
      render json: anime_list.errors, status: 422
    end
  end

  def update
    if anime_list.valid?(anime_list_params)
      render json: anime_list
    else
      render json: anime_list.errors, status: 422
    end
  end

  def destroy
    anime_list.destroy
    head :no_content
  end

  private

  def anime_list_params
    params.require(:anime_list).permit(:user_id, :anime_id, :name, :genre_preferences)
  end
  
end
