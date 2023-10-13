require "test_helper"

class СonsultationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get Сonsultation_create_url
    assert_response :success
  end
end
