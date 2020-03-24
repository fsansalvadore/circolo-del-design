ActiveAdmin.register BlogPostSection do
  belongs_to :blog_post

  permit_params blog_post_images_attributes: [
                  :id,
                  :image,
                  :image_description,
                  :image_width,
                  :_destroy
                ],
                blog_post_videos_attributes: [
                  :id,
                  :vimeo_link,
                  :vimeo_description,
                  :_destroy
                ],
                post_instagrams_attributes: [
                  :id,
                  :link,
                  :visible,
                  :_destroy
                ],
                post_text_longs_attributes: [
                  :id,
                  :content,
                  :visible,
                  :_destroy
                ],
                post_text_shorts_attributes: [
                  :id,
                  :content,
                  :visible,
                  :_destroy
                ]
  # config.sort_order = 'position_asc'

  # index do
  #   selectable_column
  #   handle_column
  #   column :section_title
  #   column :published

  #   actions
  # end
end
