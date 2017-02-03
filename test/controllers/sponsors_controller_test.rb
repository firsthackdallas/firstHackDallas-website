require 'test_helper'

class SponsorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sponsors_index_url
    assert_response :success
  end

end
