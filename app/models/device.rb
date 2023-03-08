class Device < ApplicationRecord
  belongs_to :client

  def name
    self.unique_id + " (" + self.product + ")"
  end

    scope :gateways, -> { where(device_type: "GATEWAY") }
    scope :beams, -> { where(product: "Portal Beam") }
end
