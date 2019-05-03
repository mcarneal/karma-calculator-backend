class Event < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :karma, numericality: { less_than_or_equal_to: 10,  only_integer: true }
  validates :karma, numericality: { greater_than_or_equal_to: -10,  only_integer: true }


end
