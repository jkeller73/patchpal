class Plant < ApplicationRecord
  has_many :patches, through: :patch_plant
  has_many :sowing_months, dependent: :destroy
  has_many :harvest_months, dependent: :destroy
  # validates :name, presence: true
  validates :description, presence: true
  validates :hardiness, presence: true
  validates :position_in, presence: true
  validates :sowing, presence: true
  # validates :more_info, presence: true
  validates :photo, presence: true
end
