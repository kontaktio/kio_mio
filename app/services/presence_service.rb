class PresenceService

  def get_presence_by_room(client, kio_room_id)
    bs = BaseService.new
    url = "https://apps.cloud.us.kontakt.io/v3/presences/history"
    url = url + "?roomId=#{kio_room_id}"

    last_week = DateTime.now - 1.hour
    start_time = last_week.utc.iso8601
    url = url + "&startTime=#{start_time}"

    while !url.nil?
        url = bs.get_content(url, client, self)
    end
  end

  def get_presence(client, tracking_id)
    bs = BaseService.new
    url = "https://apps.cloud.us.kontakt.io/v3/presences/history"
    url = url + "?trackingId=#{tracking_id}"

    last_week = DateTime.now - 1.hour
    start_time = last_week.utc.iso8601
    url = url + "&startTime=#{start_time}"

    while !url.nil?
        url = bs.get_content(url, client, self)
    end
  end

  # PresenceService.new.get_presence(Client.first, "e9:02:3e:69:36:08")

  def write_output(json, client)
    count = 0

    json["content"].each do |presence|

      device = Device.find_by(mac: presence["trackingId"])

      start_time = Time.parse(presence["startTime"]) unless presence["startTime"].nil?
      end_time = Time.parse(presence["endTime"]) unless presence["endTime"].nil?

      p = Presence.create(kio_room_id: presence["roomId"],
                  kio_device_id: device.kio_device_id,
                  start_time: start_time,
                  end_time: end_time)

      BaseService.check(p)
      count += 1
    end
    puts "Count: #{count}"
  end
end
