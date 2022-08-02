require "application_system_test_case"

class FavColorsTest < ApplicationSystemTestCase
  setup do
    @fav_color = fav_colors(:one)
  end

  test "visiting the index" do
    visit fav_colors_url
    assert_selector "h1", text: "Fav colors"
  end

  test "should create fav color" do
    visit fav_colors_url
    click_on "New fav color"

    fill_in "Color", with: @fav_color.color
    fill_in "First name", with: @fav_color.first_name
    fill_in "Last name", with: @fav_color.last_name
    click_on "Create Fav color"

    assert_text "Fav color was successfully created"
    click_on "Back"
  end

  test "should update Fav color" do
    visit fav_color_url(@fav_color)
    click_on "Edit this fav color", match: :first

    fill_in "Color", with: @fav_color.color
    fill_in "First name", with: @fav_color.first_name
    fill_in "Last name", with: @fav_color.last_name
    click_on "Update Fav color"

    assert_text "Fav color was successfully updated"
    click_on "Back"
  end

  test "should destroy Fav color" do
    visit fav_color_url(@fav_color)
    click_on "Destroy this fav color", match: :first

    assert_text "Fav color was successfully destroyed"
  end
end
