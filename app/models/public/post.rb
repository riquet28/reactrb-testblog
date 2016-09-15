class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :for_user, ->(user_id) { where(user_id: user_id) }

  # validates :user, presence:true
end
