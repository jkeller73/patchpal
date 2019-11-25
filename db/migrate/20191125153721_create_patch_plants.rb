class CreatePatchPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :patch_plants do |t|
      t.date :plant_date
      t.date :harvest_date
      t.references :plant, foreign_key: true
      t.references :patch, foreign_key: true

      t.timestamps
    end
  end
end
