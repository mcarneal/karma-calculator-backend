class CommentChannel < ApplicationCable::Channel
  def subscribed
    event = Event.find(params['id'])
    stream_for event
  end

  def unsubscribed
    raise "huh?"
  end
end
