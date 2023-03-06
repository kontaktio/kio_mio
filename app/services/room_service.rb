require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'csv'

class RoomService
  def get_rooms(client, parent)
    bs = BaseService.new
      url = "http://apps.cloud.us.kontakt.io/v2/locations/rooms"

      while !url.nil?
          url = bs.write_content(url, client)
      end
  end

  def write_output(json, client)
    room_count = 0
    json["content"].each do |room|

      Room.create(client_id: client.id,
                  room_id: room["id"],
                  name: room["name"],
                  floor_name: room["floor"]["name"],
                  building_name: room["floor"]["building"]["name"])

        room_count += 1
    end
    puts "Room count: #{room_count}"
  end
end
