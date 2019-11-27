class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.string :type_of_alert
      t.string :message
      t.references :patch_plant, foreign_key: true

      t.timestamps
    end
  end
end
