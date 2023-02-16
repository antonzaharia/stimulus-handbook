class Tweet < ApplicationRecord
  belongs_to :user
  has_many :ideas, -> { order(position: :asc) }, inverse_of: :tweet
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :ideas, reject_if: :all_blank, allow_destroy: true

  def liked?(user)
    self.likes.find { |like| like.user_id == user.id }
  end
end
