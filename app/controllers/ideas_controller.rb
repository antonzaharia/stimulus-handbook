class IdeasController < ApplicationController
  def move
    @idea = Idea.find(params[:idea_id])
    @idea.insert_at(params[:position].to_i)
    head :ok
  end
end