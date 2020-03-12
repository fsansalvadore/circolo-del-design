ActiveAdmin.register Face do

  permit_params :nome, :cognome, :azienda, :ruolo, :image, :published

  config.comments = false

  member_action :publish_face, method: :put do
    face = Face.find(params[:id])
    face.update(published: true)
    redirect_to admin_face_path(face)
  end

  member_action :unpublish_face, method: :put do
    face = Face.find(params[:id])
    face.update(published: false)
    redirect_to admin_face_path(face)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_face_path(face), method: :put if !face.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_face_path(face), method: :put if face.published
  end

  member_action :publish, method: :put do
    face = Face.find(params[:id])
    face.update(published: true)
    redirect_to admin_faces_path
  end

  member_action :unpublish, method: :put do
    face = Face.find(params[:id])
    face.update(published: false)
    redirect_to admin_faces_path
  end

  index do
    selectable_column
    column "Nome Completo / Titolo" do |face|
      link_to "#{face.nome} #{face.cognome}", admin_face_path(face)
    end
    column :azienda
    column :ruolo
    column :published
    column "Pubblica" do |face|
      if !face.published
        link_to "Pubblica", publish_admin_face_path(face), method: :put
      else
        link_to "Metti offline", unpublish_admin_face_path(face), method: :put
      end
    end
    actions defaults: true do |face|
      link_to 'Duplica', clone_admin_face_path(face)
    end
  end

  member_action :clone, method: :get do
    @face = resource.dup
    @face.save!
    redirect_to admin_faces_path
  end

  show title: :cognome do
    attributes_table do
      row :nome
      row :cognome
      row :azienda
      row :ruolo
      row :image do |i|
        image_tag(cl_image_path(face.image), class: "image-preview")
      end
      row :published
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Face' do
      f.input :nome, placeholder: 'Nome'
      f.input :cognome, placeholder: 'Cognome', hint: "Obbligatorio: tutti i volti verranno mostrati in ordine alfabetico in base al Cognome."
      f.input :azienda, placeholder: 'Azienda'
      # f.input :categoria, as: :select, collection: ['Designer', 'Azienda'], prompt: "Seleziona una categoria"
      f.input :ruolo, placeholder: 'Ruolo'
      f.input :image, as: :file, :image_preview => true, hint: "Obbligatorio"
      f.input :published
    end
    f.actions
  end

end
