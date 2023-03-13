class Device < ApplicationRecord
  self.primary_key = "kio_device_id"
  belongs_to :client
  has_many :presences, foreign_key: 'kio_device_id'

  scope :debugging, -> { where('position_debugging is not null')}
  scope :gateways, -> { where(device_type: "GATEWAY") }
  scope :beams, -> { where(product: "Portal Beam") }
  scope :beacons, -> { where(device_type: "BEACON") }
  scope :tags, -> { where(product: "Asset Tag 2").or(where(product: "Smart Badge")) }

  def name
    self.unique_id + " (" + self.product + ")"
  end
end
