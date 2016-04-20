class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
    t.string :title
    t.text :description
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
