class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find(params['id'])
    render json: @event

  end

  def create
    event = Event.create(event_params)
    all_events = Event.all
    all_comments = Comment.all
    ActionCable.server.broadcast("feed", {events: all_events, comments: all_comments = Comment.all})
  end

  def update

    @event = Event.find(params['id'])
    @event.karma = event_params['karma']
    @event.save
    all_events = Event.all
    ActionCable.server.broadcast("feed", {events: all_events, comments: all_comments = Comment.all})
  end

  def destroy
  end

  private

  def event_params
  params.require(:event).permit(:location, :description, :user_id, :id, :karma, :username, :comments, :userid, :created_by, :lat, :lng, :created_at)
end

end
