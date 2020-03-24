class PostInstagram < ApplicationRecord
  belongs_to :blog_post_section
  belongs_to :blog_post

end
