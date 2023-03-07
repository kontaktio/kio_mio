# WIP

# https://developer.kontakt.io/docs/dev-ctr-device-api/4184b4da1e465-get-devices#response-body

# rails g scaffold Device client_id:integer
# kio_device_id:integer unique_id:string device_type model product firmware order_id

class DeviceService
  def clear_devices(client)
    Device.where(client_id: client.id).delete_all
  end

  def get_devices(client)
    clear_devices(client)

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

      d = Device.create(client_id: client.id,
                  kio_device_id: device["id"],
                  unique_id: device["uniqueId"],
                  firmware: device["firmware"],
                  model: device["model"],
                  mac: device["mac"],
                  last_seen: Time.at(device["lastSeen"]),
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
