class BlogPostSection < ApplicationRecord
  belongs_to :blog_post

  mount_uploader :image, EventImageUploader
end
