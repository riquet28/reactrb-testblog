class Comment < ActiveRecord::Base
  belongs_to :post
  # scope :for_post, ->(post_id) { where(post_id: post_id) }
end
