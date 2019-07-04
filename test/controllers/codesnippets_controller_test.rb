require 'test_helper'

class CodesnippetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @codesnippet = codesnippets(:one)
  end

  test "should get index" do
    get codesnippets_url, as: :json
    assert_response :success
  end

  test "should create codesnippet" do
    assert_difference('Codesnippet.count') do
      post codesnippets_url, params: { codesnippet: { code: @codesnippet.code, name: @codesnippet.name } }, as: :json
    end

    assert_response 201
  end

  test "should show codesnippet" do
    get codesnippet_url(@codesnippet), as: :json
    assert_response :success
  end

  test "should update codesnippet" do
    patch codesnippet_url(@codesnippet), params: { codesnippet: { code: @codesnippet.code, name: @codesnippet.name } }, as: :json
    assert_response 200
  end

  test "should destroy codesnippet" do
    assert_difference('Codesnippet.count', -1) do
      delete codesnippet_url(@codesnippet), as: :json
    end

    assert_response 204
  end
end
