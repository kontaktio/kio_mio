class Client < ApplicationRecord
  has_many :rooms
  has_many :buildings
end
