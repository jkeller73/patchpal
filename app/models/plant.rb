class Plant < ApplicationRecord
  has_many_attached :photos
  has_many :patches, through: :patch_plant
  has_many :sowing_months
  has_many :harvest_months
  validates :name, presence: true
  validates :description, presence: true
  validates :hardiness, presence: true
  validates :position_in, presence: true
  validates :sowing, presence: true
  validates :more_info
end
