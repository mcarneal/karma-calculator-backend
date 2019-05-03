class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
  end

  def create
    comment = Comment.create(comment_params)
    all_events = Event.all
    ActionCable.server.broadcast("feed", {events: all_events, comments: all_comments = Comment.all })

  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id, :event_id, :username)
  end

end
