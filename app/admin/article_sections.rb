ActiveAdmin.register ArticleSection do
  belongs_to :article

  config.sort_order = 'position'

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :visible, :rich_text, :rich_text_small, :image, :image_description, :image_width, :video_provider, :video_link, :video_description, :instagram_link, :twitter_link, :soundcloud_link, :article_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :visible, :rich_text, :rich_text_small, :image, :image_description, :image_width, :video_provider, :video_link, :video_description, :instagram_link, :twitter_link, :soundcloud_link, :article_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
