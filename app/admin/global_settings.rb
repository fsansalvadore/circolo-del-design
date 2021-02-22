ActiveAdmin.register GlobalSetting do
  menu parent: 'Impostazioni', label: 'Globali', priority: 1
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :site_title, :favicon, :facebook_url, :youtube_url, :instagram_url, :linkedin_url, :meta_image, :meta_description, :main_email, :main_tel, :opening_hours
  #
  # or
  #
  # permit_params do
  #   permitted = [:site_title, :favicon, :facebook_url, :youtube_url, :instagram_url, :linkedin_url, :meta_image, :meta_description, :main_email, :main_tel, :opening_hours]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
