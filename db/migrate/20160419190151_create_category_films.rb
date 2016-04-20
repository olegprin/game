class CreateCategoryFilms < ActiveRecord::Migration
  def change
    create_table :category_films do |t|
      t.string :category_of_game
      t.integer :film_id
      t.timestamps null: false
    end
  end
end
