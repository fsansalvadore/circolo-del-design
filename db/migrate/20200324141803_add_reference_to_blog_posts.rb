class AddReferenceToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_instagrams,   :blog_post, foreign_key: true
    add_reference :post_text_longs,   :blog_post, foreign_key: true
    add_reference :post_text_shorts,  :blog_post, foreign_key: true
  end
end
