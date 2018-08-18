require 'test_helper'

class MakeQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get make_questions_index_url
    assert_response :success
  end

  test "should get edit" do
    get make_questions_edit_url
    assert_response :success
  end

  test "should get delete" do
    get make_questions_delete_url
    assert_response :success
  end

  test "should get add" do
    get make_questions_add_url
    assert_response :success
  end

end
