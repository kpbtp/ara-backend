class CreateAnimes < ActiveRecord::Migration[7.0]
  def change
    create_table :animes do |t|
      t.string :name
      t.string :year
      t.text :synopsis
      t.string :run_time
      t.integer :seasons
      t.integer :episodes
      t.string :studio
      t.text :genres

      t.timestamps
    end
  end
end
