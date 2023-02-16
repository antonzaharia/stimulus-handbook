class LikesController < ApplicationController
  def new
    @like = Likes.find(params[:id])
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = @tweet.likes.find { |like| like.user_id == current_user.id }

    if @like
      # Unlike
      @like.destroy!
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.turbo_stream
      end
    else
      # Like
      if @like = @tweet.likes.create!(user: current_user)
        respond_to do |format|
          format.html { redirect_to tweets_path }
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  end
end
