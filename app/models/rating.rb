class Rating < ApplicationRecord
  belongs_to :user

  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  after_create do
    user.update(score: score)
  end

  def promoter?
    score >= 9 && score <= 10
  end

  def passive?
    score >= 7 && score <= 8
  end

  def detractor?
    score <= 6
  end
end
