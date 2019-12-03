class PatchPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :patch
  has_many :alerts, dependent: :destroy

  def check_patch_plant_harvest
    month = Time.now.strftime("%B").downcase.first(3).to_sym
    if plant.harvest_month[month] && self.plant_date && Alert.where(patch_plant: self).where(type_of_alert: "harvest").length == 0
      Alert.create(type_of_alert: "harvest", message: "It's time to harvest your #{plant.name.pluralize}", patch_plant: self)
    else
      puts "wrong month"
    end
  end

  def check_patch_plant_sowing
    month = Time.now.strftime("%B").downcase.first(3).to_sym
    if plant.sowing_month[month] && Alert.where(patch_plant: self).where(type_of_alert: "sowing").length == 0
      Alert.create(type_of_alert: "sowing", message: "It's time to sow your #{plant.name.pluralize}", patch_plant: self)
    else
      puts "wrong month"
    end
  end
end
