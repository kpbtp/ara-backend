class User < ApplicationRecord
  has_many :anime_lists
  has_many :animes, through: :anime_lists
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :email, :encrypted_password, presence: true

end
