require "test_helper"

class ConsultationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get consultation_create_url
    assert_response :success
  end
end
