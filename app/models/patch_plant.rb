class PatchPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :patch
  validates :plant_date, presence: true
end
