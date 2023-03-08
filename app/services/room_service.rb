require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'csv'

class RoomService
  def get_rooms(client)
    bs = BaseService.new
      url = "http://apps.cloud.us.kontakt.io/v2/locations/rooms"

      while !url.nil?
          url = bs.get_content(url, client, self)
      end
  end

  def write_output(json, client)
    count = 0
    json["content"].each do |room|
      # binding.break

      r = Room.create(client_id: client.id,
                  kio_room_id: room["id"],
                  name: room["name"],
                  kio_floor_id: room["floor"]["id"],
                  kio_building_id: room["floor"]["building"]["id"])

      BaseService.check(r)

      count += 1
    end
    puts "Count: #{count}"
  end
end
