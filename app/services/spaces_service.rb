require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'csv'

class SpacesService
  def clear_spaces(client)
    Floor.where(client_id: client.id).delete_all
    client.buildings.delete_all
    client.rooms.delete_all
  end

  # SpacesService.new.get_spaces(Client.first)

  def get_spaces(client)
    clear_spaces(client)

    get_buildings(client)
    # RoomService.new.get_rooms(client)
  end

  def get_buildings(client)
    bs = BaseService.new
      url = "http://apps.cloud.us.kontakt.io/v2/locations/buildings"

      while !url.nil?
          url = bs.get_content(url, client, self)
      end
  end

  def write_output(json, client)
    count = 0
    json["content"].each do |building|

      puts building

      building_id = building["id"]

      kio_building = Building.create(client_id: client.id,
                  address: building["address"],
                  kio_building_id: building_id,
                  name: building["name"],
                  lat: building["lat"],
                  lng: building["lng"])

      BaseService.check(kio_building)

      building["floors"].each do |floor|
        puts floor

        kio_floor = Floor.create(client_id: client.id,
                      kio_floor_id: floor["id"],
                      kio_building_id: building_id,
                      name: floor["name"])

        binding.break

        BaseService.check(kio_floor)
      end

        count += 1
    end
    puts "Count: #{count}"
  end
end
