ActiveAdmin.register Event do
  menu parent: 'Whats On', label: 'Eventi'

  permit_params :titolo,
                :sottotitolo,
                :slug,
                :keywords,
                :data_inizio,
                :data_fine,
                :orario,
                :curator,
                :prezzo,
                :descrizione,
                :photo,
                :image,
                :categoria,
                :sotto_categoria,
                :luogo,
                :durata,
                :posti,
                :target,
                :link,
                :published,
                :featured,
                :priority,
                event_blocks_attributes: [
                  :id,
                  :title,
                  :visible,
                  :rich_text,
                  :image_url,
                  :image_description,
                  :image_width,
                  :video_provider,
                  :video_link,
                  :video_description,
                  :instagram_link,
                  :soundcloud_link,
                  :position,
                  :_destroy
                ]

  config.comments = false

  config.sort_order = 'created_at_desc'

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
      f.input :image, as: :file, :image_preview => true, hint: "Obbligatorio"
      f.input :categoria, as: :select, collection: ['Design Insights', 'Mostra', 'Experience', 'Progetti Speciali', 'Talk', 'Workshop', 'Performance', 'Film'], prompt: "Seleziona una categoria"
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
    f.inputs "Blocchi — Ogni blocco corrisponde a una tipologia di contenuto diverso: Testo / Video / Immagine / Post Instagram / SoundCloud" do
      f.input :descrizione, as: :quill_editor, hint: "Usare questo campo se il contenuto è solo testuale."
      f.has_many :event_blocks, heading: "Blocchi di contenuti", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
        n_f.input :title, label: "Titolo Blocco", hint: "Facoltativo: Dare un titolo al blocco può servire ad identificarlo più facilmente."
        n_f.input :visible, label: "Visibilità Blocco", hint: "Togli la spunta 'visibile' se vuoi omettere momentaneamente questo blocco."
        n_f.input :rich_text, label: "Testo Lungo", as: :quill_editor, hint: "Inserisci qui un blocco di testo lungo."
        n_f.input :instagram_link, label: "Codice Post — Instagram", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://www.instagram.com/p/123456789 -> 123456789"
        n_f.input :video_provider, label: "Sorgente Video", as: :select, collection: [["Nessuno", 0], ["Vimeo", 1], ["YouTube", 2]], prompt: "Seleziona sorgente video", hint: "Indica se il video proviene da YouTube o da Vimeo."
        n_f.input :video_link, label: "Codice Video", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://vimeo.com/123456789 -> 123456789 | https://www.youtube.com/watch?v=123456789 -> 123456789"
        n_f.input :video_description, label: "Caption Video", hint: "Inserisci qui una descrizione di accompagnamento al video."
        n_f.input :image_url, label: "Immagine", as: :file, :image_preview => true
        n_f.input :image_description, label: "Caption Immagine", hint: "Inserisci qui una descrizione di accompagnamento al video."
        n_f.input :image_width, label: "Larghezza Immagine", as: :select, collection: [["20% - 1/5", "one_fifth"],["25% - 1/4", "one_fourth"],["33% - 1/3", "one_third"],["50% - 1/2", "half"],["66% - 2/3", "two_thirds"], ["75% - 3/4", "three_fourths"], ["100%", "full"]], prompt: "Seleziona layout", hint: "Di default le immagini vengono visualizzate al 100% della larghezza."
        n_f.input :soundcloud_link, label: "Codice Audio", hint: "Inserire il codice URI identificativo della traccia. Solitamente si trova sotto Share > Embed"
      end
    end
    f.actions
  end
end
