class Anime < ApplicationRecord
    has_many :anime_lists
    has_many :users, through: :anime_lists
end
