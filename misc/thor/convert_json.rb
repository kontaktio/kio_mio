require 'csv'
require 'json'
require 'pry'

CSV.open("rooms1.csv", "w") do |csv|
    response = File.open("rooms.json").read
    json = JSON.parse response
    csv << ['ID', 'Room Name', 'Floor Name', 'Building Name']

    room_count = 0
    json["content"].each do |room|
        # binding.pry
        csv << [room["id"].to_s, room["name"], 
                room["floor"]["name"], room["floor"]["building"]["name"]]

        room_count += 1
    end
    puts "Room count: #{room_count}"
end