require 'rails_helper'

RSpec.describe AnimesController, type: :request do
  describe "GET /index" do
    it 'returns a list of animes' do
      anime1 = Anime.create(name: 'Anime 1', year: '2022', synopsis: 'Synopsis 1', run_time: '30 min', seasons: 1, episodes: 12, studio: 'Studio 1', genres: 'Genre 1')
      anime2 = Anime.create(name: 'Anime 2', year: '2023', synopsis: 'Synopsis 2', run_time: '24 min', seasons: 2, episodes: 24, studio: 'Studio 2', genres: 'Genre 2')

      get '/animes'

      expect(response).to have_http_status(200)
      expect(response.body).to include(anime1.to_json)
      expect(response.body).to include(anime2.to_json)
    end
  end

  describe "GET /show" do
    it 'returns a single anime' do
      anime = Anime.create(name: 'Anime 1', year: '2022', synopsis: 'Synopsis 1', run_time: '30 min', seasons: 1, episodes: 12, studio: 'Studio 1', genres: 'Genre 1')

      get "/animes/#{anime.id}"

      expect(response).to have_http_status(200)
      expect(response.body).to eq(anime.to_json)
    end
  end
end



