require 'test_helper'

class OvertimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get overtimes_index_url
    assert_response :success
  end

end
