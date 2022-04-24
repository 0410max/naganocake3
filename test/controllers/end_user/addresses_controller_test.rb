require "test_helper"

class EndUser::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_addresses_edit_url
    assert_response :success
  end
end
