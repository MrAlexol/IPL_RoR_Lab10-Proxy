require "test_helper"

class NegotiatorControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get negotiator_input_url
    assert_response :success
  end

  test "should get view" do
    get negotiator_view_url
    assert_response :success
  end
end
