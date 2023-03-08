require "application_system_test_case"

class PresencesTest < ApplicationSystemTestCase
  setup do
    @presence = presences(:one)
  end

  test "visiting the index" do
    visit presences_url
    assert_selector "h1", text: "Presences"
  end

  test "should create presence" do
    visit presences_url
    click_on "New presence"

    fill_in "Duration", with: @presence.duration
    fill_in "End time", with: @presence.end_time
    fill_in "Kio device", with: @presence.kio_device_id
    fill_in "Kio room", with: @presence.kio_room_id
    fill_in "Start time", with: @presence.start_time
    click_on "Create Presence"

    assert_text "Presence was successfully created"
    click_on "Back"
  end

  test "should update Presence" do
    visit presence_url(@presence)
    click_on "Edit this presence", match: :first

    fill_in "Duration", with: @presence.duration
    fill_in "End time", with: @presence.end_time
    fill_in "Kio device", with: @presence.kio_device_id
    fill_in "Kio room", with: @presence.kio_room_id
    fill_in "Start time", with: @presence.start_time
    click_on "Update Presence"

    assert_text "Presence was successfully updated"
    click_on "Back"
  end

  test "should destroy Presence" do
    visit presence_url(@presence)
    click_on "Destroy this presence", match: :first

    assert_text "Presence was successfully destroyed"
  end
end
