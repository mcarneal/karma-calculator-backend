class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :event

  attributes :description, :user_id, :event_id
end
