require 'rails_helper'

RSpec.describe Anime, type: :model do
  it 'should validate presence of name' do
    anime = Anime.new(year: '2023', synopsis: 'Test synopsis', run_time: '30 minutes', seasons: 1, episodes: 12, studio: 'Test Studio', genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:name]).to include("can't be blank")
  end

  it 'should validate presence of year' do
    anime = Anime.new(name: 'Test Anime', synopsis: 'Test synopsis', run_time: '30 minutes', seasons: 1, episodes: 12, studio: 'Test Studio', genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:year]).to include("can't be blank")
  end

  it 'should validate presence of synopsis' do
    anime = Anime.new(name: 'Test Anime', year: '2023', run_time: '30 minutes', seasons: 1, episodes: 12, studio: 'Test Studio', genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:synopsis]).to include("can't be blank")
  end

  it 'should validate presence of run_time' do
    anime = Anime.new(name: 'Test Anime', year: '2023', synopsis: 'Test synopsis', seasons: 1, episodes: 12, studio: 'Test Studio', genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:run_time]).to include("can't be blank")
  end

  it 'should validate presence and non-negativity of seasons' do
    anime = Anime.new(name: 'Test Anime', year: '2023', synopsis: 'Test synopsis', run_time: '30 minutes', episodes: 12, studio: 'Test Studio', genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:seasons]).to include("can't be blank")
  end

  it 'should validate presence and non-negativity of episodes' do
    anime = Anime.new(name: 'Test Anime', year: '2023', synopsis: 'Test synopsis', run_time: '30 minutes', seasons: 1, studio: 'Test Studio', genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:episodes]).to include("can't be blank")
  end

  it 'should validate presence of studio' do
    anime = Anime.new(name: 'Test Anime', year: '2023', synopsis: 'Test synopsis', run_time: '30 minutes', seasons: 1, episodes: 12, genres: 'Action')
    expect(anime).to_not be_valid
    expect(anime.errors[:studio]).to include("can't be blank")
  end

  it 'should validate presence of genres' do
    anime = Anime.new(name: 'Test Anime', year: '2023', synopsis: 'Test synopsis', run_time: '30 minutes', seasons: 1, episodes: 12, studio: 'Test Studio')
    expect(anime).to_not be_valid
    expect(anime.errors[:genres]).to include("can't be blank")
  end
end


