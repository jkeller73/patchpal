class PatchPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :patch
  has_many :alerts

  def check_patch_plant_harvest
    month = Time.now.strftime("%B").downcase.first(3).to_sym
    if plant.harvest_month[month] && Alert.where(patch_plant: self).where(type_of_alert: "harvest").where("created_at > ?", 6.months.ago).length == 0
      Alert.create(type_of_alert: "harvest", message: "It's time to harvest your #{plant.name}", patch_plant: self)
    else
      puts "wrong month"
    end
  end
end
