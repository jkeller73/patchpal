# class HarvestReminderJob < ApplicationJob
#   queue_as :default

#   def perform(patch_plant_id)
#     @patch_plant = PatchPlant.find(patch_plant_id)
#     Alert.create(type: "harvest", message: "It's time to harvest your #{@patch_plant.name}", patch_plant: @patch_plant)
#     # Do something later
#   end
# end

# # add column for growing_time
# sowing reminder + add now etc

