class MainController < ApplicationController
  def index
    redirect_to tweets_path if user_signed_in?
  end
end
