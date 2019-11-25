class CreatePatches < ActiveRecord::Migration[5.2]
  def change
    create_table :patches do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
