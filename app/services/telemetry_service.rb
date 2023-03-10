class TelemetryService
  def get_telemetry(client, tracking_id)
    bs = BaseService.new
      url = "https://apps.cloud.us.kontakt.io/v3/telemetry"
      url = url + "?trackingId=#{tracking_id}"

      while !url.nil?
        url.gsub!("maxResult=50", "maxResult=250")
        url = bs.get_content(url, client, self)
    end
  end

  def write_output(json, client)
    count = 0
    position = json["content"].first
    device = Device.find_by(mac: position["trackingId"])
    last_update = Time.parse(position["lastUpdate"])
    puts last_update
    # binding.break

    p = Position.create(kio_room_id: position["roomId"],
                        kio_device_id: device.kio_device_id,
                        x: device["x"],
                        y: device["y"],
                        last_update: last_update)

    BaseService.check(p)

  count += 1

    puts "Count: #{count}"
  end
end
