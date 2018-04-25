require 'test_helper'

class CfpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cfp_index_url
    assert_response :success
  end

end
