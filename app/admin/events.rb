ActiveAdmin.register Event do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :photo, :image, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured
  config.comments = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :immagine, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # scope :pubblicati, ->{where(published: true)}
  # scope :bozze, ->{where(published: false)}

  member_action :publish_event, method: :put do
    event = Event.find(params[:id])
    event.update(published: true)
    redirect_to admin_event_path(event)
  end

  member_action :unpublish_event, method: :put do
    event = Event.find(params[:id])
    event.update(published: false)
    redirect_to admin_event_path(event)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_event_path(event), method: :put if !event.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_event_path(event), method: :put if event.published
  end

  member_action :publish, method: :put do
    event = Event.find(params[:id])
    event.update(published: true)
    redirect_to admin_events_path
  end

  member_action :unpublish, method: :put do
    event = Event.find(params[:id])
    event.update(published: false)
    redirect_to admin_events_path
  end

  index do
    selectable_column
    column "Titolo" do |event|
      link_to event.titolo, admin_event_path(event)
    end
    column :categoria
    column "Data inizio", :data_inizio, :sortable => :data_inizio
    column "Data fine", :data_fine
    column :published
    column :featured
    column "Pubblica" do |event|
      if !event.published
        link_to "Pubblica", publish_admin_event_path(event), method: :put
      else
        link_to "Metti offline", unpublish_admin_event_path(event), method: :put
      end
    end

    actions
  end

  filter :titolo
  filter :data_inizio
  filter :data_fine
  filter :categoria
  filter :published
  filter :featured

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Event' do
      f.input :titolo, placeholder: 'Titolo'
      f.input :sottotitolo, placeholder: 'Sottotitolo'
      f.input :data_inizio, as: :datepicker
      f.input :data_fine, as: :datepicker
      f.input :orario, placeholder: 'Opzionale'
      f.input :prezzo, placeholder: 'Default: Gratuito per i soci', default: 'Gratuito per i soci'
      f.input :descrizione, as: :quill_editor
      f.input :image, as: :file
      f.input :categoria
      f.input :luogo, placeholder: 'Default: Via San Francesco da Paola 17 10123 Torino TO Italia'
      f.input :durata, placeholder: 'Opzionale'
      f.input :posti, placeholder: 'Opzionale'
      f.input :target, placeholder: 'Opzionale'
      f.input :link, placeholder: 'Opzionale'
      f.input :featured
      f.input :published
    end
    f.actions
  end
end
