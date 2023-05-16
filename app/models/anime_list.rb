class AnimeList < ApplicationRecord
    belongs_to :user
    belongs_to :anime
    validates :user_id, :anime_id, :name, :genre_preferences, presence: true
end
