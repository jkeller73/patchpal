class CreateHarvestMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :harvest_months do |t|
      t.string :jan
      t.string :feb
      t.string :mar
      t.string :apr
      t.string :may
      t.string :jun
      t.string :jul
      t.string :aug
      t.string :sept
      t.string :oct
      t.string :nov
      t.string :dec
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
