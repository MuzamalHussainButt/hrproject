require 'test_helper'

class ComplaintControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get complaint_index_url
    assert_response :success
  end

end
