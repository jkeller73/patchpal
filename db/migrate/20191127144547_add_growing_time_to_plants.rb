class AddGrowingTimeToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :growing_time, :string
  end
end
