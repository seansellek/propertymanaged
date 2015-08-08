class AddForeignKeyToPictures < ActiveRecord::Migration
  def change
    add_foreign_key :pictures, :tickets
  end
end
