class AddImageableToPicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.timestamps null: false
    end
  end
end
