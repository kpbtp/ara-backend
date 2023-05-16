require 'rails_helper'

RSpec.describe AnimeList, type: :model do
  let(:user) { User.create(
    email: 'test1@example.com',
    password: 'password',
    password_confirmation: 'password'
  ) }

  it 'should validate user_id presence' do
    anime_list = AnimeList.new(
      anime_id: 1,
      name: 'My Anime List',
      genre_preferences: "Action"
    )
    expect(anime_list).to_not be_valid
    expect(anime_list.errors[:user_id]).to include("can't be blank")
  end

  it 'should validate anime_id presence' do
    anime_list = AnimeList.new(
      user_id: user.id,
      name: 'My Anime List',
      genre_preferences: "Action"
    )
    expect(anime_list).to_not be_valid
    expect(anime_list.errors[:anime_id]).to include("can't be blank")
  end

  it 'should validate name presence' do
    anime_list = AnimeList.new(
      user_id: user.id,
      anime_id: 1,
      genre_preferences: "Action"
    )
    expect(anime_list).to_not be_valid
    expect(anime_list.errors[:name]).to include("can't be blank")
  end

  it 'should validate genre_preferences presence' do
    anime_list = AnimeList.new(
      user_id: user.id,
      anime_id: 1,
      name: 'My Anime List',
    )
    expect(anime_list).to_not be_valid
    expect(anime_list.errors[:genre_preferences]).to include("can't be blank")
  end
end
