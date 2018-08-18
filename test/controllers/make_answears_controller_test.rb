require 'test_helper'

class MakeAnswearsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get make_answears_add_url
    assert_response :success
  end

  test "should get edit" do
    get make_answears_edit_url
    assert_response :success
  end

  test "should get delete" do
    get make_answears_delete_url
    assert_response :success
  end

end
