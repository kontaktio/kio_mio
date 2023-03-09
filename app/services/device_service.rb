class DeviceService
  def clear_devices(client)
    Device.where(client_id: client.id).delete_all
  end

  def get_devices(client)
    bs = BaseService.new
      url = "https://api.kontakt.io/device"

      while !url.nil? && !url.empty?
          url.gsub!("maxResult=50", "maxResult=250")
          url = bs.get_device_content(url, client, self)
      end
  end

  def write_output(json, client)
    count = 0

    #binding.break

    json["devices"].each do |device|

      last_seen = Time.at(device["lastSeen"]) unless device["lastSeen"].nil?

      d = Device.create(client_id: client.id,
                  kio_device_id: device["id"],
                  unique_id: device["uniqueId"],
                  firmware: device["firmware"],
                  model: device["model"],
                  mac: device["mac"]&.downcase,
                  last_seen: last_seen,
                  deployment_status: device["deployment"]["status"],
                  battery_level: device["batteryLevel"],
                  order_id: device["orderId"],
                  device_type: device["deviceType"],
                  product: device["product"])

      BaseService.check(d)

      count += 1
    end
    puts "Count: #{count}"
  end
end
