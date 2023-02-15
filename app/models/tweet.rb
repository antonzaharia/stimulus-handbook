class Tweet < ApplicationRecord
  belongs_to :user
  has_many :ideas, inverse_of: :tweet
  accepts_nested_attributes_for :ideas, reject_if: :all_blank, allow_destroy: true
end
