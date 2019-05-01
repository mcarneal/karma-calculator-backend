class FeedChannel < ApplicationCable::Channel
  def subscribed
    byebug 
    stream_from "feed"
  end

  def unsubscribed
    raise "huh?"
  end
end
