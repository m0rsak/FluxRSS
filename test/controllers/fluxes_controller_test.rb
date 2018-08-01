require 'test_helper'

class FluxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fluxes_index_url
    assert_response :success
  end

end
