ActiveAdmin.register Page do
  menu parent: 'Pagine', label: 'Pagine', priority: 5

  permit_params :title,
                :cover,
                :abstract,
                :slug,
                :lang,
                :priority,
                :published_at,
                content_blocks_attributes: [
                  :id,
                  :title,
                  :is_visible,
                  :rich_text,
                  :image,
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

  # action_item :publish, only: :index do
  #   link_to "Pubblica", publish_admin_page_path(page), method: :put if !page.is_published
  # end

  # action_item :unpublish, only: :index do
  #   link_to "Metti offline", unpublish_admin_page_path(page), method: :put if page.is_published
  # end

  member_action :publish, method: :put do
    page = Page.friendly.find_by_slug(params[:id])
    page.update(is_published: true, published_at: DateTime.now())
    redirect_to admin_pages_path
  end

  member_action :unpublish, method: :put do
    page = Page.friendly.find_by_slug(params[:id])
    page.update(is_published: false, published_at: nil)
    redirect_to admin_pages_path
  end

  # member_action :clone_page, method: :get do
  #   @page = resource.dup
  #   @page.save!
  #   redirect_to admin_pages_path
  # end

  index do
    selectable_column
    column "Titolo" do |page|
      link_to page.title, admin_page_path(page)
    end
    column :slug
    column "Data di creazione", :created_at
    column "Data ultimo aggiornamento", :updated_at
    column "Pubblicato", :is_published
    column "Data di pubblicazione", :published_at
    column "Pubblica" do |page|
      if !page.is_published
        link_to "Pubblica", publish_admin_page_path(page), method: :put
      else
        link_to "Metti offline", unpublish_admin_page_path(page), method: :put
      end
    end
    # actions defaults: true do |page|
    #   link_to 'Duplica', clone_page_admin_page_path(page)
    # end
  end

  show title: :title do
    columns do
      column do
        attributes_table :title => "Info" do
          row :title
          row :slug
          row :abstract
          row :cover do |page|
            if page.cover && !page.cover.file.nil?
              image_tag(cl_image_path(page.cover), class: "image-preview")
            end
          end
        end
      end
      column do
        attributes_table :title => "Attività" do
          row :is_published
          row :published_at
          row :created_at
          row :updated_at
        end
      end
    end
  end

  # enable image deletion
  member_action :delete_image, method: :delete do
    @img = Cloudinary::CarrierWave.find(params[:id])
    @img.purge_later
    redirect_back(fallback_location: edit_admin_workshop_path)
  end
  
  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab :pagina do
        f.inputs "Dettagli" do
          f.input :title, label: "Titolo pagina"
          f.input :slug, label: "Slug pagina"
          f.input :abstract, as: :text, input_html: { maxlength: 255, rows: 4 }, hint: "Massimo 255 caratteri", label: "Descrizione breve"
          f.input :cover, as: :file, label: "Immagine di copertina", :image_preview => true
        end
      end
      tab :meta do
        f.has_many :page_meta_datum, heading: "Meta Data", allow_destroy: true do |n_f|
          n_f.input :meta_title, label: "Meta Title", placeholder: 'Meta Title'
          n_f.input :meta_description, label: "Meta Description", placeholder: 'Meta Description', input_html: { maxlength: 255 }, hint: "Massimo 255 caratteri"
          n_f.input :meta_keywords, label: "Meta Keywords", placeholder: 'Meta Keywords'
          n_f.input :meta_image, as: :file, label: "Meta Image", :image_preview => true
        end
      end
    end
    f.inputs 'Contenuto' do
      f.has_many :content_blocks, heading: "Blocchi", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
        n_f.input :title, label: "Titolo Sezione", hint: "Facoltativo: Dare un titolo alla sezione può servire ad identificarla più facilmente."
        n_f.input :kind, label: "Blocco", as: :select, collection: [["Testo", 0], ["Immagine", 1], ["Video", 2], ["Instagram", 3], ["Audio", 4], ["Link", 5]], prompt: "Seleziona sorgente video", hint: "Definisce quale tipologia di blocco viene visualizzata."
        n_f.input :rich_text, label: "Testo Lungo", as: :quill_editor, hint: "Inserisci qui un blocco di testo lungo."
        n_f.input :video_provider, label: "Sorgente Video", as: :select, collection: [["Nessuno", 0], ["Vimeo", 1], ["YouTube", 2]], prompt: "Seleziona sorgente video", hint: "Indica se il video proviene da YouTube o da Vimeo."
        n_f.input :video_link, label: "Codice Video", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://vimeo.com/123456789 -> 123456789 | https://www.youtube.com/watch?v=123456789 -> 123456789"
        n_f.input :video_description, label: "Caption Video", hint: "Inserisci qui una descrizione di accompagnamento al video."
        n_f.input :image, label: "Immagine", as: :file, :image_preview => true
        n_f.input :image_description, label: "Caption Immagine", hint: "Inserisci qui una descrizione di accompagnamento al video."
        n_f.input :image_width, label: "Larghezza Immagine", as: :select, collection: [["20% - 1/5", "one_fifth"],["25% - 1/4", "one_fourth"],["33% - 1/3", "one_third"],["50% - 1/2", "half"],["66% - 2/3", "two_thirds"], ["75% - 3/4", "three_fourths"], ["100%", "full"]], prompt: "Seleziona layout", hint: "Di default le immagini vengono visualizzate al 100% della larghezza."
        n_f.input :instagram_link, label: "Codice Post — Instagram", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://www.instagram.com/p/123456789 -> 123456789"
        n_f.input :audio_provider, label: "Sorgente Audio", as: :select, collection: [["Nessuno", 0], ["SoundCloud", 1], ["MixCloud", 2], ["Spotify", 3]], prompt: "Seleziona sorgente audio", hint: "Indica se il video proviene da SoundCloud, MixCloud o Spotify."
        n_f.input :soundcloud_link, label: "Codice Audio", hint: "Inserire il codice URI identificativo della traccia. Solitamente si trova sotto Share > Embed"
        n_f.input :link_url, label: "Destinazione Link"
        n_f.input :link_label, label: "Testo link"
        n_f.input :link_target, label: "Link target"
        n_f.input :link_style, label: "Stile link", collection: [["Testo", 0], ["Bottone", 1]], prompt: "Seleziona tipologia link"
        n_f.input :is_visible, label: "Visibilità Sezione", hint: "Togli la spunta 'visibile' se vuoi omettere momentaneamente questa sezione."
      end
    end
    f.actions
  end
end
