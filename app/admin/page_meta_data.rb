ActiveAdmin.register PageMetaDatum do
  belongs_to :newsletter_page
  belongs_to :page
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :metadatable_type, :metadatable_id, :metaTitle, :metaKeywords, :metaDescription, :metaImage, :favicon, :isPublished, :publishedAt
  #
  # or
  #
  # permit_params do
  #   permitted = [:metadatable_type, :metadatable_id, :metaTitle, :metaKeywords, :metaDescription, :metaImage, :favicon, :isPublished, :publishedAt]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
