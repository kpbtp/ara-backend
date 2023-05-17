require 'rails_helper'

RSpec.describe "AnimeLists", type: :request do
  let(:user) { User.create(email: "testing@example.com", password: "password", password_confirmation: "password") }
  let(:anime) { Anime.create(
    name: "Attack on Titan",
    year: "2013",
    synopsis: "Humans fight against giant humanoid creatures called Titans.",
    run_time: "24 minutes",
    seasons: 4,
    episodes: 75,
    studio: "Wit Studio",
    genres: "Action, Drama, Fantasy"
  )}

  describe "GET /index" do
    it 'gets a list of anime lists' do
      user.anime_lists.create(
        anime_id: anime.id,
        name: "My Favorite Anime",
        genre_preferences: "Action, Adventure"
      )

      get '/anime_lists'
      expect(response).to have_http_status(200)
      
      anime_list = JSON.parse(response.body)

      expect(anime_list.length).to eq(1)
    end
  end

  describe "POST /create" do
    it "does not create an anime list without user id" do
      # The params we are going to send with the request 
      #  this should fail because it does not pass validation
      anime_list_params = {
        anime_list: {
          anime_id: anime.id,
          name: "My Favorite Anime",
          genre_preferences: "Action, Adventure"
        }
      }
  
      # Send the request to the server
      post '/anime_lists', params: anime_list_params
  
      # Assure that we get a failure back
      expect(response).to have_http_status(422)
  
  
      # Assure that the anime list was not created by checking for errors
      expect(JSON.parse(response.body)).to include('user')
    end
  end
  
  describe "POST /create" do
    it "creates an anime list" do
  
      anime_list_params = {
        anime_list: {
          user_id: user.id,
          anime_id: anime.id,
          name: 'My Favorite Anime',
          genre_preferences: "Action, Adventure"
        }
      }
  
      post '/anime_lists', params: anime_list_params
  
      expect(response).to have_http_status(200)
  
      anime_list = user.anime_lists
  
      expect(anime_list.first.name).to eq('My Favorite Anime')
      expect(anime_list.first.user_id).to eq(user.id)
      expect(anime_list.first.anime_id).to eq(anime.id)
    end
  end

  # This is where i left off, it dont work
  # describe "PUT /update" do
  #   it "updates an anime list" do
  #     anime_list = create(:anime_list, user: user, anime: anime, name: 'My Favorite Anime')
  
  #     updated_params = {
  #       anime_list: {
  #         name: 'Updated Anime List',
  #         genre_preferences: 'Action, Adventure, Fantasy'
  #       }
  #     }
  
  #     put "/anime_lists/#{anime_list.id}", params: updated_params
  #     puts "Response Body: #{response.body}"
  #     puts "User ID: #{user.id}"
  #     puts "Anime ID: #{anime.id}"
  #     puts "AnimeList: #{anime_list}"
  #     expect(response).to have_http_status(200)
  
  #     # Reload the anime list from the database
  #     anime_list.reload
  
  #     expect(anime_list.name).to eq('Updated Anime List')
  #     expect(anime_list.genre_preferences).to eq('Action, Adventure, Fantasy')
  #   end
  # end
  
  
end
