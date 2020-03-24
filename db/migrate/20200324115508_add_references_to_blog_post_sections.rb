class AddReferencesToBlogPostSections < ActiveRecord::Migration[5.2]
  def change
    add_reference :blog_post_images, :blog_post_section, foreign_key: true
    add_reference :blog_post_videos, :blog_post_section, foreign_key: true
  end
end
