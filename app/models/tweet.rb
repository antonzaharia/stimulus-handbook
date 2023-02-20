class Tweet < ApplicationRecord
  belongs_to :user
  has_many :ideas, -> { order(position: :asc) }, inverse_of: :tweet, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :ideas, reject_if: :all_blank, allow_destroy: true

  validates :body, presence: true

  def liked?(user)
    self.likes.find { |like| like.user_id == user.id }
  end
end
