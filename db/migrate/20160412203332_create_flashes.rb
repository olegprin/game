class CreateFlashes < ActiveRecord::Migration
  def change
    create_table :flashes do |t|
      t.integer :film_id
      t.attachment :down_file
      t.timestamps null: false
    end
  end
end
