require 'test_helper'

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get homeindex" do
    get homepage_homeindex_url
    assert_response :success
  end

end
