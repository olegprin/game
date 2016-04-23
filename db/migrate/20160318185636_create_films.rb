class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
    t.string :title
    t.text :description, default: "Get ready to spend the day with two cute sea in the house with a super entertaining baby caring challenge prepared for you! Come and join in getting the new baby game for girls started, meet the two water loves and work out your baby caring skills while taking care of these sweet bundles of joy."
    t.integer :played, default: 8

    t.string  :language
    t.integer  :rating, default: 50
 
    t.attachment :uploaded_file
    t.attachment :down_file
    t.string :category
    t.timestamps null: false
    end
  end
end
