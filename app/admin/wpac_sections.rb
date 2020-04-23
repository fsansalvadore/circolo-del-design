ActiveAdmin.register WpacSection do
  menu parent: 'WPAC', label: 'Pagina iniziale', priority: 1

  permit_params :title,
                :subtitle,
                :cover_image,
                :cover_video,
                :cover_filter_opacity,
                :cover_type,
                :meta_title,
                :meta_description,
                :meta_image,
                :intro_paragraph,
                :long_paragraph,
                :wpac_outro,
                :support_banner_title,
                :support_banner_text,
                :support_banner_cta,
                :support_banner_heart,
                :support_banner_link

  config.comments = false
  actions :all, :except => [:destroy]

  controller do
    def index
      redirect_to admin_wpac_section_path(WpacSection.all.first)
    end
  end

  show title: :title do
    columns do
      column do
        attributes_table do
          row :title
          row :subtitle
          row (:intro_paragraph) { |wpac| raw(wpac.intro_paragraph) }
          row (:long_paragraph) { |wpac| raw(wpac.long_paragraph) }
          row (:wpac_outro) { |wpac| raw(wpac.wpac_outro) }
        end
      end
      column do
        attributes_table :title => "Donazioni" do
          row :support_banner_title
          row (:support_banner_text) { |wpac| raw(wpac.support_banner_text) }
        end
        attributes_table :title => "SEO" do
          row :meta_title
          row :meta_description
        end
      end
    end
  end

  form do |f|
  f.actions
  f.semantic_errors *f.object.errors.keys
    tabs do
      tab :home_page do
        f.inputs "Home Page" do
          f.input :title, label: "Titolo"
          f.input :subtitle, label: "Sottotitolo"
          f.input :intro_paragraph, label: "Paragrafo 1", as: :quill_editor
          f.input :long_paragraph, label: "Paragrafo 2", as: :quill_editor
          f.input :wpac_outro, label: "Testo finale", as: :quill_editor
        end
      end
      tab :meta do
        f.inputs 'Meta Data' do
          f.input :meta_title, label: "Meta Title", placeholder: 'Meta Title'
          f.input :meta_description, label: "Meta Description", placeholder: 'Meta Description'
        end
      end
      tab :cover do
        f.inputs 'Cover' do
          # f.input :cover_type, label: "Tipologia Cover", as: :select, collection: [["Immagine", 1], ["Video", 2]], prompt: "Seleziona un'opzione"
          # f.input :cover_filter_opacity, label: "Intensità filtro", :as => :range, :min => 0, :max => 100, :step => 5, :input_html => { :class => "special" }
          f.input :cover_image, as: :file, :image_preview => true
          # f.input :cover_video, label: "Url video YouTube"
        end
      end
      tab :donazioni do
        f.inputs 'Donazioni' do
          f.input :support_banner_title, label: "Titolo Banner", placeholder: 'Titolo'
          f.input :support_banner_text, label: "Testo Banner", placeholder: 'Testo', as: :quill_editor
          f.input :support_banner_cta, label: "Testo CTA", placeholder: 'Inserisci una cta'
          f.input :support_banner_heart, label: "Icona"
          f.input :support_banner_link, label: "Link di atterraggio", placeholder: 'Inserisci un link'
        end
      end
  end
  f.actions
  end
end
