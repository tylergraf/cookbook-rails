require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get subcategories" do
    get :subcategories
    assert_response :success
  end

  test "should get recipes" do
    get :recipes
    assert_response :success
  end

end
