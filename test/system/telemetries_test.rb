require "application_system_test_case"

class TelemetriesTest < ApplicationSystemTestCase
  setup do
    @telemetry = telemetries(:one)
  end

  test "visiting the index" do
    visit telemetries_url
    assert_selector "h1", text: "Telemetries"
  end

  test "should create telemetry" do
    visit telemetries_url
    click_on "New telemetry"

    fill_in "Air quality", with: @telemetry.air_quality
    fill_in "Battery level", with: @telemetry.battery_level
    fill_in "Channel", with: @telemetry.channel
    fill_in "Client", with: @telemetry.client_id
    fill_in "Firmware", with: @telemetry.firmware
    fill_in "Humidity", with: @telemetry.humidity
    fill_in "Light", with: @telemetry.light
    fill_in "Model", with: @telemetry.model
    check "Moving" if @telemetry.moving
    fill_in "Rssi", with: @telemetry.rssi
    fill_in "Temperature", with: @telemetry.temperature
    fill_in "Timestamp", with: @telemetry.timestamp
    fill_in "Tracking", with: @telemetry.tracking_id
    click_on "Create Telemetry"

    assert_text "Telemetry was successfully created"
    click_on "Back"
  end

  test "should update Telemetry" do
    visit telemetry_url(@telemetry)
    click_on "Edit this telemetry", match: :first

    fill_in "Air quality", with: @telemetry.air_quality
    fill_in "Battery level", with: @telemetry.battery_level
    fill_in "Channel", with: @telemetry.channel
    fill_in "Client", with: @telemetry.client_id
    fill_in "Firmware", with: @telemetry.firmware
    fill_in "Humidity", with: @telemetry.humidity
    fill_in "Light", with: @telemetry.light
    fill_in "Model", with: @telemetry.model
    check "Moving" if @telemetry.moving
    fill_in "Rssi", with: @telemetry.rssi
    fill_in "Temperature", with: @telemetry.temperature
    fill_in "Timestamp", with: @telemetry.timestamp
    fill_in "Tracking", with: @telemetry.tracking_id
    click_on "Update Telemetry"

    assert_text "Telemetry was successfully updated"
    click_on "Back"
  end

  test "should destroy Telemetry" do
    visit telemetry_url(@telemetry)
    click_on "Destroy this telemetry", match: :first

    assert_text "Telemetry was successfully destroyed"
  end
end
