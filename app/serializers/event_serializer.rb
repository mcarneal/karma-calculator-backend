class EventSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :comments

  attributes :location, :description, :user_id, :karma, :id, :comments, :username, :userid

  def comments
    self.object.comments
  end

  def username
    self.object.user.username
  end

  def userid
    self.object.user.id
  end
end
