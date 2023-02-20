require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  setup do
    @tweet = tweets(:one)
    @idea = ideas(:one)
    @user = users(:one)
    sign_in @user
  end

  test "create new tweet with ideas" do
    visit tweets_url

    fill_in "tweet_body", with: "New tweet"
    fill_in "tweet[ideas_attributes][0][body]", with: "New idea"

    click_on "Create Tweet"
    assert_selector "h1", text: "New tweet"
    assert_selector "div", text: "New idea"
  end

  test "can update a tweet" do
    visit tweets_url
    find('div.divider', match: :first).click
    within("##{dom_id(@tweet)}") do
      fill_in "tweet_body", with: "Tweet body edited"
    end
    click_on "Update Tweet"
    assert_selector "h1", text: "Tweet body edited"
  end

end
