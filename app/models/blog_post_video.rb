class BlogPostVideo < ApplicationRecord
  validates :vimeo_id, presence: true
  belongs_to :blog_post_section
  belongs_to :blog_post
end
