ActiveAdmin.register PageHome do
  menu parent: 'Pagine', label: 'Home Page', priority: 1

  permit_params :meta_title,
                :meta_description,
                :meta_image,
                :splash_presence,
                :splash_title,
                :splash_bg_img,
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
                :newsletter_box_text

  config.comments = false
  actions :all, :except => [:destroy]
  
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
      end
    end
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
            f.input :meta_keywords, label: "Meta Description", placeholder: 'Meta Description'
            f.input :meta_image, as: :file, label: "Meta Image", :image_preview => true
          end
        end
        tab :splash_page do
          f.inputs 'Splash Page' do
            f.input :splash_presence, label: "Mostra"
            f.input :splash_bg_img, as: :file, label: "Immagine di sfondo", hint: "jpg, png, gif", :image_preview => true
            f.input :splash_title, label: "Durata in millisecondi della Splash Page. 0 per tempo infinito.", as: :quill_editor
            # f.input :splash_duration, label: "Durata in millisecondi della Splash Page. 0 per tempo infinito."
            # f.input :splash_delay, label: "Tempo di ritardo in ingresso in millisecondi."
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
