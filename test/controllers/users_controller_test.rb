require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get lista" do
    get users_lista_url
    assert_response :success
  end
end
