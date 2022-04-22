ActiveAdmin.register CardCategory do
  menu parent: 'Impostazioni', label: 'Categorie Contenuti', priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :primary_color, :secondary_color
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :primary_color, :secondary_color]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
