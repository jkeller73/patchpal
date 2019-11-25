class CreateHarvestMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :harvest_months do |t|
      t.boolean :jan
      t.boolean :feb
      t.boolean :mar
      t.boolean :apr
      t.boolean :may
      t.boolean :jun
      t.boolean :jul
      t.boolean :aug
      t.boolean :sept
      t.boolean :oct
      t.boolean :nov
      t.boolean :dec
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
