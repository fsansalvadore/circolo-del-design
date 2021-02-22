ActiveAdmin.register PageHome do
  menu parent: 'Pagine', label: 'Home Page', priority: 1

  permit_params :meta_title,
                :meta_description,
                :meta_keywords,
                :meta_image,
                :splash_presence,
                :splash_title,
                :splash_bg_img,
                :splash_bg_img_mobile,
                :splash_content_img,
                :splash_content_img_mobile,
                :splash_delay,
                :splash_duration,
                :title,
                :heading,
                :subheading,
                :carousel_presence,
                :paragraph_1,
                :paragraph_2,
                :arrow_presence,
                :arrow_icon,
                :cta_section_presence,
                :cta_section_title,
                :cta_section_link_text,
                :cta_section_link_url,
                :newsletter_box_presence,
                :newsletter_box_text,
                :hero_image,
                :hero_color_mode,
                :hero_marquee_words,
                :hero_marquee_presence,
                :column_1_title,
                :column_2_title,
                :column_3_title,
                :social_presence,
                :banner_presence,
                :banner_img_desktop,
                :banner_img_mobile,
                :banner_link,
                :banner_target,
                home_page_cards_attributes: [
                  :id,
                  :title,
                  :subtitle,
                  :image,
                  :image_alt,
                  :start_date,
                  :end_date,
                  :link,
                  :link_target,
                  :content_category,
                  :eventy_type_category,
                  :position,
                  :_destroy
                ],
                home_page_column_one_links_attributes: [
                  :id,
                  :link,
                  :label,
                  :target,
                  :link_style,
                  :position,
                  :_destroy
                ],
                home_page_column_two_links_attributes: [
                  :id,
                  :link,
                  :label,
                  :target,
                  :link_style,
                  :position,
                  :_destroy
                ],
                home_page_column_three_links_attributes: [
                  :id,
                  :link,
                  :label,
                  :target,
                  :link_style,
                  :position,
                  :_destroy
                ]

  config.comments = false
  actions :all, :except => [:destroy]
  
  controller do
    def index
      redirect_to admin_page_home_path(PageHome.all.first)
    end
  end

  show title: :title do
    columns do
      column do
        attributes_table do
          row (:heading) { |home| raw(home.heading) }
          row (:subheading) { |home| raw(home.subheading) }
          row (:paragraph_1) { |home| raw(home.paragraph_1) }
          row (:paragraph_2) { |home| raw(home.paragraph_2) }
        end
        attributes_table do
          row (:cta_section_title) { |home| raw(home.cta_section_title) }
          row :cta_section_link_url
        end
        attributes_table do
          row :newsletter_box_presence
          row (:newsletter_box_text) { |home| raw(home.newsletter_box_text) }
        end
      end
      column do
        attributes_table :title => "SEO" do
          row :meta_title
          row :meta_description
          row :meta_keywords
        end
        attributes_table :title => "Splash Page" do
          row :splash_presence
          row :splash_content_img do |home|
            if home.splash_content_img && !home.splash_content_img.file.nil?
              image_tag(cl_image_path(home.splash_content_img), class: "image-preview")
            end
          end
          row :splash_content_img_mobile do |home|
            if home.splash_content_img_mobile && !home.splash_content_img_mobile.file.nil?
              image_tag(cl_image_path(home.splash_content_img_mobile), class: "image-preview")
            end
          end
          row :splash_bg_img do |home|
            if home.splash_bg_img && !home.splash_bg_img.file.nil?
              image_tag(cl_image_path(home.splash_bg_img), class: "image-preview")
            end
          end
          row :splash_bg_img_mobile do |home|
            if home.splash_bg_img_mobile && !home.splash_bg_img_mobile.file.nil?
              image_tag(cl_image_path(home.splash_bg_img_mobile), class: "image-preview")
            end
          end
          row (:splash_title) { |home| raw(home.splash_title) }
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
        tab :heading do
          f.inputs "Heading" do
            f.input :title, label: "Titolo Pagina"
            f.input :heading, label: "Heading 1", as: :quill_editor
            f.input :subheading, label: "Sottotitolo", as: :quill_editor
            f.input :carousel_presence, label: "Carosello"
          end
        end
        tab :meta do
          f.inputs 'Meta Data' do
            f.input :meta_title, label: "Meta Title", placeholder: 'Meta Title'
            f.input :meta_description, label: "Meta Description", placeholder: 'Meta Description'
            f.input :meta_keywords, label: "Meta Keywords", placeholder: 'Meta Keywords'
            f.input :meta_image, as: :file, label: "Meta Image", :image_preview => true
          end
        end
        tab :splash_page do
          f.inputs 'Splash Page' do
            f.input :splash_presence, label: "Mostra"
            f.input :splash_content_img, as: :file, label: "Immagine in primo piano - Desktop", hint: "jpg, png, gif", :image_preview => true
            f.input :splash_content_img_mobile, as: :file, label: "Immagine in primo piano - Mobile", hint: "jpg, png, gif - Compare solo sugli schermi con larghezza inferiore a 768px.", :image_preview => true
            f.input :splash_bg_img, as: :file, label: "Immagine di sfondo - Desktop", hint: "jpg, png, gif", :image_preview => true
            f.input :splash_bg_img_mobile, as: :file, label: "Immagine di sfondo - Mobile", hint: "jpg, png, gif - Compare solo sugli schermi con larghezza inferiore a 768px.", :image_preview => true
            f.input :remove_splash_bg_img_mobile, as: :boolean, label: "Rimuovi Immagine di sfondo - Mobile", hint: "jpg, png, gif - Compare solo sugli schermi con larghezza inferiore a 768px."
            f.input :splash_title, label: "Titolo / Testo", hint: "Da scegliere in alternativa all'immagine in primo piano.", as: :quill_editor
          end
        end
    end
    f.inputs 'Cover' do
      f.input :hero_image, as: :file, label: "Immagine di sfondo", hint: "jpg, png, gif animata", :image_preview => true
      f.input :hero_color_mode, label: "Colore testo", as: :select, collection: [["Nero", 1], ["Bianco", 2]], prompt: "Seleziona la modalità colore del testo", hint: "Il testo può essere bianco o nero."
      f.input :hero_marquee_words, label: "Lista parole", hint: "Ogni parola deve essere separata da una virgola."
      f.input :hero_marquee_presence, placeholder: 'Paragrafo 2', label: "Visibilità banner scorrevole"
    end
    f.inputs "Griglia" do
      f.has_many :home_page_cards, heading: "Links", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
        n_f.input :title, label: "Titolo"
        n_f.input :content_category, label: "Categoria", as: :select, collection: [["Programma Culturale", 0], ["Progetti d'Impatto", 1], ["Servizi", 2]], prompt: "Seleziona una categoria"
        n_f.input :subtitle, label: "Sottotitolo"
        n_f.input :eventy_type_category, label: "Tipologia", as: :select, collection: ["Nessuna", 'Design Insights', 'Mostra', 'Experience', "Progetti d'Impatto", 'Podcast', 'Talk', 'Workshop'], plaheholder: "Nessuna", default: "Nessuna", prompt: "Seleziona una tipologia"
        n_f.input :image, label: "Immagine", as: :file, :image_preview => true
        n_f.input :image_alt, label: "Testo alternativo dell'immagine", hint: "Questo testo serve nel caso non venga caricata l'immagine o per gli screen readers."
        n_f.input :link, label: "Link di atterraggio", hint: "Inserire l'url completo"
        n_f.input :link_target, label: "Target _blank", hint: "Con il target _blank il link viene aperto in una nuova tab del browser"
      end
    end
    f.inputs "Collegamenti" do
      columns do
        column do
          f.input :column_1_title, label: "Titolo colonna 1"
          f.has_many :home_page_column_one_links, heading: "Links", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
            n_f.input :link, label: "Link", hint: "Inserire l'url completo di destinazione."
            n_f.input :label, label: "Testo del tasto"
            # n_f.input :link_style, label: "Tipologia", as: :select, collection: ["Nessuna", 'Design Insights', 'Mostra', 'Experience', "Progetti d'Impatto", 'Talk', 'Workshop'], plaheholder: "Nessuna", default: "Nessuna", prompt: "Seleziona una tipologia"
            n_f.input :target, label: "Target _blank", hint: "Con il target _blank il link viene aperto in una nuova tab del browser"
          end
        end
        column do
          f.input :column_2_title, label: "Titolo colonna 2"
          f.has_many :home_page_column_two_links, heading: "Links", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
            n_f.input :link, label: "Link", hint: "Inserire l'url completo di destinazione."
            n_f.input :label, label: "Testo del tasto"
            # n_f.input :link_style, label: "Tipologia", as: :select, collection: ["Nessuna", 'Design Insights', 'Mostra', 'Experience', "Progetti d'Impatto", 'Talk', 'Workshop'], plaheholder: "Nessuna", default: "Nessuna", prompt: "Seleziona una tipologia"
            n_f.input :target, label: "Target _blank", hint: "Con il target _blank il link viene aperto in una nuova tab del browser"
          end
        end
        column do
          f.input :column_3_title, label: "Titolo colonna 3"
          f.has_many :home_page_column_three_links, heading: "Links", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
            n_f.input :link, label: "Link", hint: "Inserire l'url completo di destinazione."
            n_f.input :label, label: "Testo del tasto"
            # n_f.input :link_style, label: "Tipologia", as: :select, collection: ["Nessuna", 'Design Insights', 'Mostra', 'Experience', "Progetti d'Impatto", 'Talk', 'Workshop'], plaheholder: "Nessuna", default: "Nessuna", prompt: "Seleziona una tipologia"
            n_f.input :target, label: "Target _blank", hint: "Con il target _blank il link viene aperto in una nuova tab del browser"
          end
        end
      end
    end
    f.inputs 'Paragrafi' do
      f.input :paragraph_1, placeholder: 'Paragrafo 1', as: :quill_editor
      f.input :paragraph_2, placeholder: 'Paragrafo 2', as: :quill_editor
    end
    f.inputs 'Sezione Call to Action' do
      f.input :cta_section_presence, placeholder: 'Mostra'
      f.input :cta_section_title, placeholder: 'Titolo', as: :quill_editor
      f.input :cta_section_link_text, placeholder: 'Testo link'
      f.input :cta_section_link_url, placeholder: 'Link di destinazione'
    end
    f.inputs 'Newsletter' do
      f.input :newsletter_box_presence, placeholder: 'Mostra'
      f.input :newsletter_box_text, placeholder: 'Titolo', as: :quill_editor
    end
    f.actions
  end
end
