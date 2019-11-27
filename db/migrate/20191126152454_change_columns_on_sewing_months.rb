class ChangeColumnsOnSewingMonths < ActiveRecord::Migration[5.2]
  def change
    remove_column :sowing_months, :sept
    remove_column :harvest_months, :sept
    add_column :sowing_months, :sep, :boolean
    add_column :harvest_months, :sep, :boolean
  end
end
