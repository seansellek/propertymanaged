class AddAttachmentImageToOccupancyPictures < ActiveRecord::Migration
  def self.up
    change_table :occupancy_pictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :occupancy_pictures, :image
  end
end
