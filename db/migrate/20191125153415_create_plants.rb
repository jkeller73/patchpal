class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.string :hardiness
      t.string :position_in
      t.text :sowing
      t.text :more_info

      t.timestamps
    end
  end
end
