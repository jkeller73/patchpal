class AddCompletedToAlerts < ActiveRecord::Migration[5.2]
  def change
    add_column :alerts, :completed, :boolean, default: false
  end
end
