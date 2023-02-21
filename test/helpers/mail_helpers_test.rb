require 'test_helper'

class MainHelperTest < ActionView::TestCase
  setup do 
    VCR.insert_cassette(name)
  end

  teardown do
    VCR.eject_cassette
  end

  test "non oneliner joke" do
      joke = MainHelper::Joke.new

      assert_not joke.oneliner?
      assert_equal joke.setup, "Why is Linux safe?"
      assert_equal joke.delivery, "Hackers peak through Windows only."
  end

  test "oneliner joke" do
    joke = MainHelper::Joke.new

    assert joke.oneliner?
    assert_equal joke.oneliner, "I visited my friend at his new house. He told me to make myself at home. So I threw him out. I hate having visitors."
  end
end