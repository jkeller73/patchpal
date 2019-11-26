class CreateHarvestMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :harvest_months do |t|
      t.boolean :jan, default: false
      t.boolean :feb, default: false
      t.boolean :mar, default: false
      t.boolean :apr, default: false
      t.boolean :may, default: false
      t.boolean :jun, default: false
      t.boolean :jul, default: false
      t.boolean :aug, default: false
      t.boolean :sept, default: false
      t.boolean :oct, default: false
      t.boolean :nov, default: false
      t.boolean :dec, default: false
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
