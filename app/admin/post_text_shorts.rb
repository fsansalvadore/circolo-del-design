ActiveAdmin.register PostTextShort do
  belongs_to :blog_post
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :visible, :blog_post_section_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :visible, :blog_post_section_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
