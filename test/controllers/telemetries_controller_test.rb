require "test_helper"

class TelemetriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telemetry = telemetries(:one)
  end

  test "should get index" do
    get telemetries_url
    assert_response :success
  end

  test "should get new" do
    get new_telemetry_url
    assert_response :success
  end

  test "should create telemetry" do
    assert_difference("Telemetry.count") do
      post telemetries_url, params: { telemetry: { air_quality: @telemetry.air_quality, battery_level: @telemetry.battery_level, channel: @telemetry.channel, client_id: @telemetry.client_id, firmware: @telemetry.firmware, humidity: @telemetry.humidity, light: @telemetry.light, model: @telemetry.model, moving: @telemetry.moving, rssi: @telemetry.rssi, temperature: @telemetry.temperature, timestamp: @telemetry.timestamp, tracking_id: @telemetry.tracking_id } }
    end

    assert_redirected_to telemetry_url(Telemetry.last)
  end

  test "should show telemetry" do
    get telemetry_url(@telemetry)
    assert_response :success
  end

  test "should get edit" do
    get edit_telemetry_url(@telemetry)
    assert_response :success
  end

  test "should update telemetry" do
    patch telemetry_url(@telemetry), params: { telemetry: { air_quality: @telemetry.air_quality, battery_level: @telemetry.battery_level, channel: @telemetry.channel, client_id: @telemetry.client_id, firmware: @telemetry.firmware, humidity: @telemetry.humidity, light: @telemetry.light, model: @telemetry.model, moving: @telemetry.moving, rssi: @telemetry.rssi, temperature: @telemetry.temperature, timestamp: @telemetry.timestamp, tracking_id: @telemetry.tracking_id } }
    assert_redirected_to telemetry_url(@telemetry)
  end

  test "should destroy telemetry" do
    assert_difference("Telemetry.count", -1) do
      delete telemetry_url(@telemetry)
    end

    assert_redirected_to telemetries_url
  end
end
