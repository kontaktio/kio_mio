class ImageService
  def get_image(client, floor_id)

    url = "https://apps.cloud.us.kontakt.io/v3/locations/images/FLOOR/" + floor_id.to_s
    uri = URI.parse(url)
    uri.scheme = "https"

    data_url = URI(uri.to_s)

    request = Net::HTTP::Get.new(data_url)
    request["Content-Type"] = 'application/json'
    request["Accept"] = 'application/vnd.com.kontakt+json;version=10'

    request["Api-Key"] = client.api_key

    http = Net::HTTP.new(data_url.host, data_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    response = http.request(request)
    json = JSON.parse response.read_body
    image_url = json.first["presignedUrl"]
    puts image_url
    Down.download(image_url, destination: "app/assets/images/#{floor_id.to_s}.png")
  end
end

# https://rmagick.github.io/usage.html#drawing_on
