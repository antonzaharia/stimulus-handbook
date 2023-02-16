class Idea < ApplicationRecord
  belongs_to :tweet
  acts_as_list scope: :tweet
end
