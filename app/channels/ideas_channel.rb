class IdeasChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ideas"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
