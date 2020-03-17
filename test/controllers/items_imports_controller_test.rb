require 'test_helper'

class ItemsImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get items_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get items_imports_create_url
    assert_response :success
  end

end
