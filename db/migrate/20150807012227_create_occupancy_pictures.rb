class CreateOccupancyPictures < ActiveRecord::Migration
  def change
    create_table :occupancy_pictures do |t|
      t.string :caption
      t.boolean :before

      t.timestamps null: false
    end
  end
end
