class BlogPostImage < ApplicationRecord
  validates :image, presence: true
  belongs_to :blog_post

  mount_uploader :image, EventImageUploader
end
