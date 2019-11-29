class Plant < ApplicationRecord
  has_many :patches, through: :patch_plant
  has_one :sowing_month, dependent: :destroy
  has_one :harvest_month, dependent: :destroy
  # validates :name, presence: true
  validates :description, presence: true
  validates :hardiness, presence: true
  validates :position_in, presence: true
  validates :sowing, presence: true
  # validates :more_info, presence: true
  validates :photo, presence: true

  # def return_icon(sym, table)
  #   if plant.sowing_month[:month] == true
  #     return

  # end


#<td><%= @plant.return_icon(:feb, "sowing") %></td>



end
