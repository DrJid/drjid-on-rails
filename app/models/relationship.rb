class Relationship < ActiveRecord::Base
  attr_accessible :followed_id #We make only the followed_id accessible

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
