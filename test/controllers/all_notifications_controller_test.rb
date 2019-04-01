require 'test_helper'

class AllNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_notifications_index_url
    assert_response :success
  end

end
