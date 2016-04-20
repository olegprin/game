class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.attachment :upload_picture
      t.string :category
      t.integer :count_game
      t.timestamps null: false
    end
  end
end
