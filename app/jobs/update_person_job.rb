class UpdatePersonJob < ApplicationJob
  queue_as :default

  def perform(user_id, score)
    User.find(user_id).update(score: score)
  end
end
