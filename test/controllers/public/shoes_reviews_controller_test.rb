require "test_helper"

class Public::ShoesReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_shoes_reviews_new_url
    assert_response :success
  end

  test "should get index" do
    get public_shoes_reviews_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_shoes_reviews_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_shoes_reviews_show_url
    assert_response :success
  end
end
