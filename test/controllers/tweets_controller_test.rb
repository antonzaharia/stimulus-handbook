require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet = tweets(:one)
    @user = users(:one)
    sign_in @user
  end

  test "redirected if not logged in" do
    sign_out :user
    get tweets_url
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Sign In"
  end

  test "visit the tweets idnex" do
    get tweets_url
    assert_response :success
  end

  test "can create a tweet" do
    assert_difference("Tweet.count") do
      post tweets_url, params: { tweet: { body: "Test" } }
    end
  end

  test "cannot create tweet without body" do
    assert_no_difference("Tweet.count") do
      post tweets_url, params: { tweet: { body: "" } }
    end
  end

  test "can view tweet" do
    get tweet_url(@tweet)
    assert_response :success
  end

  test "can update tweet" do
    put tweet_url(@tweet), params: { tweet: { body: "Changed in test" } }
    @tweet.reload
    assert_equal "Changed in test", @tweet.body
  end

  test "can NOT update tweet with invalid attributes" do
    put tweet_url(@tweet), params: { tweet: { body: "" } }
    @tweet.reload
    assert_not_equal "Changed in test", @tweet.body
  end

  test "can destroy tweet" do
    assert_difference("Tweet.count", -1) do
      delete tweet_url(@tweet)
    end
    assert_redirected_to :tweets
  end

end
