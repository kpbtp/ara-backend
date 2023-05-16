class Anime < ApplicationRecord
    has_many :anime_lists
    has_many :users, through: :anime_lists

    validates :name, :year, :synopsis, :run_time, 
            :seasons, :episodes, :studio, :genres, presence: true
end
