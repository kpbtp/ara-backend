class CreateAnimeLists < ActiveRecord::Migration[7.0]
  def change
    create_table :anime_lists do |t|
      t.integer :user_id
      t.integer :anime_id
      t.string :name
      t.text :genre_preferences

      t.timestamps
    end
  end
end
