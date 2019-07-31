require "application_system_test_case"

class BusesTest < ApplicationSystemTestCase
  setup do
    @bus = buses(:one)
  end

  test "visiting the index" do
    visit buses_url
    assert_selector "h1", text: "Buses"
  end

  test "creating a Bus" do
    visit buses_url
    click_on "New Bus"

    fill_in "Bus owner", with: @bus.bus_owner_id
    fill_in "Name", with: @bus.name
    fill_in "Registration no", with: @bus.registration_no
    fill_in "Total no of seats", with: @bus.total_no_of_seats
    click_on "Create Bus"

    assert_text "Bus was successfully created"
    click_on "Back"
  end

  test "updating a Bus" do
    visit buses_url
    click_on "Edit", match: :first

    fill_in "Bus owner", with: @bus.bus_owner_id
    fill_in "Name", with: @bus.name
    fill_in "Registration no", with: @bus.registration_no
    fill_in "Total no of seats", with: @bus.total_no_of_seats
    click_on "Update Bus"

    assert_text "Bus was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus" do
    visit buses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus was successfully destroyed"
  end
end
