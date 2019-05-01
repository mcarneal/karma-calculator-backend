class FeedChannel < ApplicationCable::Channel
  def subscribed
    stream_from "feed"
  end

  def unsubscribed
    raise "huh?"
  end
end
