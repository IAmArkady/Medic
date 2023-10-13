require "test_helper"

class RecommendationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recommendation_index_url
    assert_response :success
  end

  test "should get show" do
    get recommendation_show_url
    assert_response :success
  end

  test "should get create" do
    get recommendation_create_url
    assert_response :success
  end
end
