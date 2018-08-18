require 'test_helper'

class RollmodeltestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rollmodeltest = rollmodeltests(:one)
  end

  test "should get index" do
    get rollmodeltests_url
    assert_response :success
  end

  test "should get new" do
    get new_rollmodeltest_url
    assert_response :success
  end

  test "should create rollmodeltest" do
    assert_difference('Rollmodeltest.count') do
      post rollmodeltests_url, params: { rollmodeltest: { email: @rollmodeltest.email, name: @rollmodeltest.name } }
    end

    assert_redirected_to rollmodeltest_url(Rollmodeltest.last)
  end

  test "should show rollmodeltest" do
    get rollmodeltest_url(@rollmodeltest)
    assert_response :success
  end

  test "should get edit" do
    get edit_rollmodeltest_url(@rollmodeltest)
    assert_response :success
  end

  test "should update rollmodeltest" do
    patch rollmodeltest_url(@rollmodeltest), params: { rollmodeltest: { email: @rollmodeltest.email, name: @rollmodeltest.name } }
    assert_redirected_to rollmodeltest_url(@rollmodeltest)
  end

  test "should destroy rollmodeltest" do
    assert_difference('Rollmodeltest.count', -1) do
      delete rollmodeltest_url(@rollmodeltest)
    end

    assert_redirected_to rollmodeltests_url
  end
end
