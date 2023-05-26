class AddAddressesToAnimeList < ActiveRecord::Migration[7.0]
  def change
    add_column :anime_lists, :address, :text, array: true, default: []
  end
end
