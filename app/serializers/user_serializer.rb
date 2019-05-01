class UserSerializer < ActiveModel::Serializer
  has_many :events
  has_many :comments

  attributes :id, :username, :password_digest
end
