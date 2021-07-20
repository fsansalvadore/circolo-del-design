ActiveAdmin.register Collaborator do
  menu parent: "Pagine", label: 'About Us - Welcome on Board', priority: 2
  include ActiveAdmin::SortableTable # creates the controller action which handles the sorting
  config.sort_order = 'position_asc'
  config.comments = false

  permit_params :nome, :cognome, :image, :published

  member_action :publish_collaborator, method: :put do
    collaborator = Collaborator.find(params[:id])
    collaborator.update(published: true)
    redirect_to admin_collaborator_path(collaborator)
  end

  member_action :unpublish_collaborator, method: :put do
    collaborator = Collaborator.find(params[:id])
    collaborator.update(published: false)
    redirect_to admin_collaborator_path(collaborator)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_collaborator_path(collaborator), method: :put if !collaborator.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_collaborator_path(collaborator), method: :put if collaborator.published
  end

  member_action :publish, method: :put do
    collaborator = Collaborator.find(params[:id])
    collaborator.update(published: true)
    redirect_to admin_collaborators_path
  end

  member_action :unpublish, method: :put do
    collaborator = Collaborator.find(params[:id])
    collaborator.update(published: false)
    redirect_to admin_collaborators_path
  end

  index do
    selectable_column
    handle_column
    column "Nome" do |member|
      link_to "#{member.nome} #{member.cognome}", admin_collaborator_path(member)
    end
    column :published
    column "Pubblica" do |member|
      if !member.published
        link_to "Pubblica", publish_admin_collaborator_path(member), method: :put
      else
        link_to "Metti offline", unpublish_admin_collaborator_path(member), method: :put
      end
    end
  end

  show title: :cognome do
    attributes_table do
      row :nome
      row :cognome
      row :position
      row :image do |i|
        image_tag(cl_image_path(collaborator.image), class: "image-preview")
      end
      row :published
    end
  end

  filter :nome
  filter :cognome
  filter :published

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Persona' do
      f.input :nome, placeholder: 'Nome', hint: "Obbligatorio"
      f.input :cognome, placeholder: 'Cognome', hint: "Obbligatorio"
      f.input :image, as: :file, :image_preview => true, hint: "Obbligatoria"
      f.input :published
    end
    f.actions
  end
end
