ActiveAdmin.register Event do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :titolo, :sottotitolo, :slug, :keywords, :data_inizio, :data_fine, :orario, :curator, :prezzo, :descrizione, :photo, :image, :categoria, :sotto_categoria, :luogo, :durata, :posti, :target, :link, :published, :featured, :priority
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
  config.sort_order = 'created_at_asc'

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
    link_to "Anteprima live", event_path(event)
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
    actions defaults: true do |event|
      link_to 'Duplica', clone_admin_event_path(event)
    end
  end

  member_action :clone, method: :get do
    @event = resource.dup
    @event.save!
    redirect_to admin_events_path
  end

  show title: :titolo do
    attributes_table do
      row :titolo
      row :sottotitolo
      row :slug
      row :keywords
      row :image do |i|
        image_tag(cl_image_path(event.image), class: "image-preview")
      end
      row :data_inizio
      row :data_fine
      row :orario
      row :curator
      row :prezzo
      row (:descrizione) { |event| raw(event.descrizione) }
      row :categoria
      row :sotto_categoria
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
      f.input :keywords, placeholder: 'Inserisci parole chiave', hint: "Le keywords verranno usate nei meta-tag della pagina e devono essere separate da una virgola."
      f.input :data_inizio, as: :date_time_picker, hint: "Obbligatorio"
      f.input :data_fine, as: :date_time_picker, hint: "Obbligatorio (Se uguale a 'Data inizio' verrà mostrato il singolo giorno)"
      f.input :orario, placeholder: 'Orario', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :curator, placeholder: 'A cura di...', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :prezzo, placeholder: 'Inserisci prezzo', hint: "Default: Gratuito per i soci"
      f.input :descrizione, as: :quill_editor, hint: "Obbligatorio"
      f.input :image, as: :file, :image_preview => true, hint: "Obbligatorio"
      f.input :categoria, as: :select, collection: ['Design Insights', 'Mostra', 'Experience', 'Progetti Speciali', 'Talk', 'Workshop'], prompt: "Seleziona una categoria"
      f.input :sotto_categoria, placeholder: 'Inserisci una sotto categoria', hint: 'Opzionale: se inserito compare di fianco alla categoria principale.'
      f.input :luogo, placeholder: 'Inserisci indirizzo', hint: 'Default: Via San Francesco da Paola 17 10123 Torino TO Italia'
      f.input :durata, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :posti, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :target, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :link, placeholder: 'Opzionale', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      f.input :featured, hint: "Gli eventi 'featured' compariranno nella colonna 'Mostre in evidenza' nella pagina Programma, durante le date effettive della mostra."
      f.input :published
      f.input :priority, as: :select, collection: [["1 — In evidenza", 1], ["2 — Secondo", 2], ["3 — Terzo", 3], ["4 — Quarto", 4], ["5 — Nessuna Priorità", 5]], prompt: "Seleziona l'ordine in Home Page", hint: "Gli eventi in Home Page vengono mostrati in ordine di Priorirà (da 1 a 4) o per Data d'inizio nel caso di stessa priorità. Gli eventi con priorità 5 non compaiono in Home Page."
    end
    f.actions
  end
end
