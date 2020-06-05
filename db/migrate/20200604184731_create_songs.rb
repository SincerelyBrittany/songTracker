class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
     t.string :name
     t.string :picture
     t.string :url
     t.string :genre
     t.timestamps
   end
  end
end
