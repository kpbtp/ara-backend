class User < ApplicationRecord
has_many :anime_lists
has_many :animes, through: :anime_lists
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
