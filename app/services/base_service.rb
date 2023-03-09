require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'csv'

class BaseService
  def get_content(url, client, parent)
    puts "Getting content from #{url}"

    uri = URI.parse(url)
    uri.scheme = "https"

    data_url = URI(uri.to_s)

    request = Net::HTTP::Get.new(data_url)
    request["Content-Type"] = 'application/json'

    request["Api-Key"] = client.api_key

    http = Net::HTTP.new(data_url.host, data_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)

    # binding.break
    json = JSON.parse response.read_body

    parent.write_output(json, client)

    next_url = json["links"].map{|link| link if link["rel"] == "next"}.compact

    if next_url.first.nil?
        return nil
    else
        return next_url.first["href"]
    end
  end

  def get_device_content(url, client, parent)
    puts "Getting content from #{url}"

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

    parent.write_output(json, client)

    next_url = json["searchMeta"]["nextResults"]

    if next_url.nil? || next_url.first.nil?
        return nil
    else
        return next_url
    end
  end

  def self.check(thing)
    puts thing.errors.details unless thing.valid?
  end
end
