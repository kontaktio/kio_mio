class PositionsService

  def get_positions(client, tracking_id)
    bs = BaseService.new
      url = "https://apps.cloud.us.kontakt.io/v2/positions/history"
      url = url + "?trackingId=#{tracking_id}"

      last_week = DateTime.now - 1.day
      start_time = last_week.utc.iso8601
      url = url + "&startTime=#{start_time}"

      while !url.nil?
          url = bs.get_content(url, client, self)
      end
  end

  def write_output(json, client)
    count = 0

    json["content"].each do |position|
      binding.break
      device = Device.find_by(mac: position["trackingId"])

      p = Position.create(kio_room_id: position["roomId"],
        kio_device_id: device.kio_device_id,
        x: position["x"],
        y: position["y"],
        kio_timestamp: Time.parse(position["timestamp"]))

      BaseService.check(p)
      count += 1
    end
    puts "Count: #{count}"
  end
end
