require "test_helper"

class EndUser::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get end_user_orders_new_url
    assert_response :success
  end

  test "should get index" do
    get end_user_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_orders_show_url
    assert_response :success
  end
end
