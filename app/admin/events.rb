ActiveAdmin.register Event do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :titolo, :sottotitolo, :slug, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :photo, :image, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured, :priority
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

  controller do
    defaults :finder => :find_by_slug
  end

  member_action :publish_event, method: :put do
    event = Event.friendly.find_by_slug(params[:id])
    event.update(published: true)
    redirect_to admin_event_path(event)
  end

  member_action :unpublish_event, method: :put do
    event = Event.friendly.find_by_slug(params[:id])
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
    event = Event.friendly.find_by_slug(params[:id])
    event.update(published: true)
    redirect_to admin_events_path
  end

  member_action :unpublish, method: :put do
    event = Event.friendly.find_by_slug(params[:id])
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
      row :slug
      row :image do |i|
        image_tag(cl_image_path(event.image), class: "image-preview")
      end
      row :data_inizio
      row :data_fine
      row :orario
      row :prezzo
      row (:descrizione) { |event| raw(event.descrizione) }
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
      f.input :titolo, placeholder: 'Titolo', hint: "Verrà usato automaticamente come Meta Title e nell'indirizzo URL della pagina. (Obbligatorio — Preferibilmente max 40 caratteri)"
      f.input :sottotitolo, placeholder: 'Sottotitolo', hint: "Verrà anche utilizzato come Meta Description della pagina. (Obbligatorio — Max 140 caratteri)"
      f.input :slug, placeholder: :slug, hint: "È come verrà visualizzato l'indirizzo URL della pagina. Viene impostato automaticamente in base al Titolo se lasciato vuoto."
      f.input :data_inizio, as: :datepicker, hint: "Obbligatorio"
      f.input :data_fine, as: :datepicker, hint: "Obbligatorio (Se uguale a 'Data inizio' verrà mostrato il singolo giorno)"
      f.input :orario, placeholder: 'Orario', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :prezzo, placeholder: 'Inserisci prezzo', hint: "Default: Gratuito per i soci"
      f.input :descrizione, as: :quill_editor, hint: "Obbligatorio"
      f.input :image, as: :file, :image_preview => true, hint: "Obbligatorio"
      f.input :categoria, as: :select, collection: ['Mostra', 'Evento', 'Progetti Speciali', 'Talk', 'Workshop'], prompt: "Seleziona una categoria"
      f.input :luogo, placeholder: 'Inserisci indirizzo', hint: 'Default: Via San Francesco da Paola 17 10123 Torino TO Italia'
      f.input :durata, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :posti, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :target, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :link, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :featured, hint: "Gli eventi 'featured' andranno nella colonna 'Mostre in evidenza' nella pagina Programma"
      f.input :published
      f.input :priority, as: :select, collection: [["1 — In evidenza", 1], ["2 — Secondo", 2], ["3 — Terzo", 3], ["4 — Quarto", 4], ["5 — Nessuna Priorità", 5]], prompt: "Seleziona l'ordine in Home Page", hint: "Gli eventi in Home Page vengono mostrati in ordine di Data d'inizio a meno che non venga impostata una priorità. Gli eventi con priorità 1 vengono mostrati per primi, quelli con 5 per ultimi (valore di default)."
    end
    f.actions
  end
end
