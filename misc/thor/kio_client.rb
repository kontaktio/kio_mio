require 'thor'

class KioClient < Thor
    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'pry'
    require 'json'
    require 'csv'

    desc "get_rooms", "Get json data for client rooms"
    def get_rooms
        url = "http://apps.cloud.us.kontakt.io/v2/locations/rooms"

        filename = "rooms.csv"
        prep_csv(filename)

        count = 0
        while !url.nil?
            url = write_content(url, filename)
            count += 1
        end
    end

    desc "check_api_key", "Check to see KIO_API_KEY is defined"
    def check_api_key
        if ENV["KIO_API_KEY"].nil?
            puts "No KIO_API_KEY defined!"
        else
            puts "KIO_API_KEY defined: " + ENV["KIO_API_KEY"]
        end
    end

    protected
    def write_content(url, filename)
        puts "Getting content from #{url}"

        uri = URI.parse(url)
        uri.scheme = "https"

        data_url = URI(uri.to_s)

        request = Net::HTTP::Get.new(data_url)
        request["Content-Type"] = 'application/json'
        request["Api-Key"] = ENV["KIO_API_KEY"]

        http = Net::HTTP.new(data_url.host, data_url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        response = http.request(request)

        json = JSON.parse response.read_body
        write_csv(json, filename)

        next_url = json["links"].map{|link| link if link["rel"] == "next"}.compact

        if next_url.first.nil?
            return nil
        else
            return next_url.first["href"]
        end
    end

    def prep_csv(filename)
        CSV.open(filename, "a") do |csv|
            csv << ['ID', 'Room Name', 'Floor Name', 'Building Name']
        end
    end

    def write_csv(json, filename)
        CSV.open(filename, "a") do |csv|
            room_count = 0
            json["content"].each do |room|
                csv << [room["id"].to_s, room["name"],
                        room["floor"]["name"], room["floor"]["building"]["name"]]

                room_count += 1
            end
            puts "Room count: #{room_count}"
        end

    end
end

KioClient.start(ARGV)
