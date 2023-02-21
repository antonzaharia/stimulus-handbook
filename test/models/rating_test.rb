require "test_helper"

class RatingTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper
  
  test "valid if score is between 0 and 10" do
    0.upto(10).each do |i|
      rating = Rating.new(score: i)
      rating.valid?
      assert_empty rating.errors[:score]
    end
  end

  test "invalid if score is bigger than 10" do
    rating = Rating.new(score: 11)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "invalid if score is less than 0" do
    rating = Rating.new(score: -1)
    rating.valid?
    assert_not rating.errors[:score].empty?
  end

  test "promoter? returns true if score is 9 or 10" do
    9.upto(10).each do |i|
      rating = Rating.new(score: i)
      assert rating.promoter?
    end
  end

  test "promoter? returns false if score is less than 9" do
    rating = Rating.new(score: 8)
    assert_not rating.promoter?
  end

  test "promoter? returns false if score is bigger than 10" do
    rating = Rating.new(score: 11)
    assert_not rating.promoter?
  end

  test "passive? returns true if score is 7 or 8" do
    7.upto(8).each do |i|
      rating = Rating.new(score: i)
      assert rating.passive?
    end
  end

  test "passive? returns false if score is bigger than 8" do
    rating = Rating.new(score: 9)
    assert_not rating.passive?
  end

  test "passive? returns false if score is less than 7" do
    rating = Rating.new(score: 6)
    assert_not rating.passive?
  end

  test "detractor? returns true if score is less than or equal to 6" do
    0.upto(6).each do |i|
      rating = Rating.new(score: i)
      assert rating.detractor?
    end
  end

  test "detractor? returns false if score is bigger than 6" do
    rating = Rating.new(score: 7)
    assert_not rating.detractor?
  end

  test "update user score cache when created" do
    user = users(:one)
    user.ratings.create(score: 9)
    perform_enqueued_jobs
    assert_equal 9, user.reload.score
  end
end
