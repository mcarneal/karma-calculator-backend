class EventSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :comments

  attributes :location, :description, :user_id
end
