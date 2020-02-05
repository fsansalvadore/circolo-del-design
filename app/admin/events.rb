ActiveAdmin.register Event do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :photo, :image, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured, :priority
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
    column :priority
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

  show title: :titolo do
    attributes_table do
      row :titolo
      row :sottotitolo
      row :data_inizio
      row :data_fine
      row :orario
      row :prezzo
      row :descrizione
      row :image
      row :categoria
      row :luogo
      row :durata
      row :posti
      row :target
      row :link
      row :featured
      row :published
      row :priority
    end
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
      f.input :categoria, as: :select, collection: ['Mostra', 'Evento', 'Programmi Speciali', 'Talk', 'Workshop'], prompt: "Seleziona una categoria"
      f.input :luogo, placeholder: 'Default: Via San Francesco da Paola 17 10123 Torino TO Italia'
      f.input :durata, placeholder: 'Opzionale'
      f.input :posti, placeholder: 'Opzionale'
      f.input :target, placeholder: 'Opzionale'
      f.input :link, placeholder: 'Opzionale'
      f.input :featured
      f.input :published
      f.input :priority, as: :select, collection: [["1 — In evidenza", 1], ["2 — Secondo", 2], ["3 — Terzo", 3], ["4 — Quarto", 4], ["5 — Nessuna", 5]], prompt: "Seleziona l'ordine in Home Page"
      # f.input :priority, :as => :number, :min => 1, :max => 5, :step => 1
    end
    f.actions
  end
end
