class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.find { |like| like.user_id == current_user.id }

    respond_to do |format|
      if @like
        # Unlike
        @like.destroy!
        @like = @tweet.likes.new
      else
        # Like
        @like = @tweet.likes.create!(user: current_user)
      end
      format.html { redirect_to tweets_path }
      format.turbo_stream
    end
  end
end
