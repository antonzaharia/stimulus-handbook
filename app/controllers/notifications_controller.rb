class NotificationsController < ApplicationController
  def index
    @likes = current_user.tweets.includes(:likes).map(&:likes).flatten
  end
end