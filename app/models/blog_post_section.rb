class BlogPostSection < ApplicationRecord
  belongs_to :blog_post

  mount_uploader :image, EventImageUploader
  acts_as_list
end
