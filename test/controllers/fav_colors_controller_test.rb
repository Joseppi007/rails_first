require "test_helper"

class FavColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fav_color = fav_colors(:one)
  end

  test "should get index" do
    get fav_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_fav_color_url
    assert_response :success
  end

  test "should create fav_color" do
    assert_difference("FavColor.count") do
      post fav_colors_url, params: { fav_color: { color: @fav_color.color, first_name: @fav_color.first_name, last_name: @fav_color.last_name } }
    end

    assert_redirected_to fav_color_url(FavColor.last)
  end

  test "should show fav_color" do
    get fav_color_url(@fav_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_fav_color_url(@fav_color)
    assert_response :success
  end

  test "should update fav_color" do
    patch fav_color_url(@fav_color), params: { fav_color: { color: @fav_color.color, first_name: @fav_color.first_name, last_name: @fav_color.last_name } }
    assert_redirected_to fav_color_url(@fav_color)
  end

  test "should destroy fav_color" do
    assert_difference("FavColor.count", -1) do
      delete fav_color_url(@fav_color)
    end

    assert_redirected_to fav_colors_url
  end
end
