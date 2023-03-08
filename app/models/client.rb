class Client < ApplicationRecord
  has_many :rooms
  has_many :buildings
  has_many :floors, through: :buildings
  has_many :devices
end
