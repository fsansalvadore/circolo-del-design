ActiveAdmin.register TeamMember do
  menu parent: "Pagine", label: 'About Us - Team', priority: 2
  include ActiveAdmin::SortableTable # creates the controller action which handles the sorting
  config.sort_order = 'position_asc'

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :nome, :cognome, :ruolo, :order, :image, :published
  #
  # or
  #
  # permit_params do
  #   permitted = [:nome, :cognome, :ruolo, :order, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  config.comments = false

  member_action :publish_team_member, method: :put do
    team_member = TeamMember.find(params[:id])
    team_member.update(published: true)
    redirect_to admin_team_member_path(team_member)
  end

  member_action :unpublish_team_member, method: :put do
    team_member = TeamMember.find(params[:id])
    team_member.update(published: false)
    redirect_to admin_team_member_path(team_member)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_team_member_path(team_member), method: :put if !team_member.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_team_member_path(team_member), method: :put if team_member.published
  end

  member_action :publish, method: :put do
    team_member = TeamMember.find(params[:id])
    team_member.update(published: true)
    redirect_to admin_team_members_path
  end

  member_action :unpublish, method: :put do
    team_member = TeamMember.find(params[:id])
    team_member.update(published: false)
    redirect_to admin_team_members_path
  end

  index do
    selectable_column
    handle_column
    column "Nome" do |member|
      link_to "#{member.nome} #{member.cognome}", admin_team_member_path(member)
    end
    column :ruolo
    column :published
    column "Pubblica" do |member|
      if !member.published
        link_to "Pubblica", publish_admin_team_member_path(member), method: :put
      else
        link_to "Metti offline", unpublish_admin_team_member_path(member), method: :put
      end
    end
    # actions defaults: true do |member|
    #   link_to 'Duplica', clone_admin_team_member_path(member)
    # end
  end

  # member_action :clone, method: :get do
  #   @team_member = resource.dup
  #   @team_member.save!
  #   redirect_to admin_team_members_path
  # end

  show title: :cognome do
    attributes_table do
      row :nome
      row :cognome
      row :ruolo
      row :position
      row :image do |i|
        image_tag(cl_image_path(team_member.image), class: "image-preview")
      end
      row :published
    end
  end

  filter :nome
  filter :cognome
  filter :ruolo
  filter :published

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'TeamMember' do
      f.input :nome, placeholder: 'Nome', hint: "Obbligatorio"
      f.input :cognome, placeholder: 'Cognome', hint: "Obbligatorio"
      f.input :ruolo, placeholder: "Ruolo", hint: "Obbligatorio"
      f.input :image, as: :file, :image_preview => true, hint: "Obbligatoria"
      f.input :published
    end
    f.actions
  end

end
