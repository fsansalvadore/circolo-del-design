ActiveAdmin.register SpecialProject do
  menu label: "Progetti d'Impatto"

  permit_params :title,
                :published,
                :show_in_nav,
                :cover,
                :content,
                :slug,
                :meta_keywords,
                :meta_title,
                :meta_description,
                :intro_image,
                :intro_video,
                :intro_video_provider,
                :intro_media_select,
                :link_cta,
                :link_url,
                :year,
                special_project_blocks_attributes: [
                  :id,
                  :title,
                  :visible,
                  :rich_text,
                  :image_url,
                  :image_description,
                  :image_width,
                  # :image_set,
                  :video_provider,
                  :video_link,
                  :video_description,
                  :instagram_link,
                  # :audio_provider,
                  :soundcloud_link,
                  :position,
                  :_destroy
                ]

  config.comments = false
  config.sort_order = 'created_at_desc'

  controller do
    defaults :finder => :find_by_slug
  end

  member_action :publish_special_project, method: :put do
    special_project = SpecialProject.friendly.find_by_slug(params[:id])
    special_project.update(published: true)
    redirect_to admin_special_project_path(special_project)
  end

  member_action :unpublish_special_project, method: :put do
    special_project = SpecialProject.friendly.find_by_slug(params[:id])
    special_project.update(published: false)
    redirect_to admin_special_project_path(special_project)
  end

  action_item :publish, only: :show do
    link_to "Anteprima live", special_project_path(special_project)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_special_project_path(special_project), method: :put if !special_project.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_special_project_path(special_project), method: :put if special_project.published
  end

  member_action :publish, method: :put do
    special_project = SpecialProject.friendly.find_by_slug(params[:id])
    special_project.update(published: true)
    redirect_to admin_special_projects_path
  end

  member_action :unpublish, method: :put do
    special_project = SpecialProject.friendly.find_by_slug(params[:id])
    special_project.update(published: false)
    redirect_to admin_special_projects_path
  end

  index do
    selectable_column
    column "Titolo" do |special_project|
      link_to special_project.title, admin_special_project_path(special_project)
    end
    column "Anno", :year, :sortable => :year
    column :published
    column "Pubblica" do |special_project|
      if !special_project.published
        link_to "Pubblica", publish_admin_special_project_path(special_project), method: :put
      else
        link_to "Metti offline", unpublish_admin_special_project_path(special_project), method: :put
      end
    end
    actions defaults: true do |special_project|
      link_to 'Duplica', clone_special_project_admin_special_project_path(special_project)
    end
  end

  member_action :clone_special_project, method: :get do
    @special_project = resource.dup
    @special_project.save!
    redirect_to admin_special_projects_path
  end

  show title: :title do
    attributes_table do
      row :published
      row :title
      row :slug
      row :year
      # row :cover do |special_project|
      #   if special_project.cover
      #     image_tag(cl_image_path(special_project.cover), class: "image-preview")
      #   end
      # end
      row :meta_keywords
      row :meta_title
      row :meta_description
      row (:content) { |special_project| raw(special_project.content) }
      row :link_url
    end
  end

  filter :title
  filter :year
  filter :published

  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab :progetto do
        f.inputs 'Progetto Speciale' do
          f.input :published
          f.input :show_in_nav, label: "Mostra nella navigazione", hint: "Questa selezione permette di posizionare questo elemento negli elementi di navigazione, sotto a Progetti d'impatto."
          f.input :title, placeholder: 'Titolo', label: "Titolo progetto", hint: "Verrà usato automaticamente come Meta Title e nell'indirizzo URL della pagina. (Obbligatorio — Preferibilmente max 40 caratteri)"
          f.input :year, as: :date_time_picker, label: "Anno", hint: "Inserire una qualsiasi data nell'anno desiderato."
          f.input :cover, as: :file, :image_preview => true, hint: "Obbligatorio"
        end
      end
      tab :meta do
        f.inputs 'Meta' do
          f.input :meta_keywords, placeholder: 'Inserisci parole chiave', hint: "Le keywords verranno usate nei meta-tag della pagina e devono essere separate da una virgola."
          f.input :meta_title, placeholder: 'Inserisci parole chiave', hint: "Le keywords verranno usate nei meta-tag della pagina e devono essere separate da una virgola."
          f.input :meta_description, placeholder: 'Inserisci parole chiave', hint: "Le keywords verranno usate nei meta-tag della pagina e devono essere separate da una virgola."
        end
      end
    end
    f.inputs 'Contenuto' do
      f.input :intro_media_select, label: "Tipologia intro", as: :select, collection: [["Nessuno", 0], ["Immagine", 1], ["Video", 2]], prompt: "Seleziona intro", hint: "Seleziona la tipologia di intro."
      f.input :intro_image, as: :file, :image_preview => true, hint: "Compare come intro se selezionato in 'Tipologia intro'"
      f.input :intro_video, placeholder: 'Url Vimeo', hint: "Inserire l'intero indirizzo url del video. Compare come intro se selezionato in 'Tipologia intro'"
      f.input :content, as: :quill_editor, hint: "Obbligatorio"
      f.input :link_url, placeholder: '"Scopri di più"', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
      # f.input :link_cta, placeholder: '"Scopri di più"', hint: "Opzionale: Se lasciato vuoto non compare nella pagina."
    end
    f.inputs "Sezioni — Ogni sezione corrisponde a una tipologia di contenuto diverso: Testo / Video / Immagine / Post Instagram / SoundCloud" do
      f.has_many :special_project_blocks, heading: "Sezioni del contenuto", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
        n_f.input :title, label: "Titolo Sezione", hint: "Facoltativo: Dare un titolo alla sezione può servire ad identificarla più facilmente."
        n_f.input :visible, label: "Visibilità Sezione", hint: "Togli la spunta 'visibile' se vuoi omettere momentaneamente questa sezione."

        n_f.input :rich_text, label: "Testo Lungo", as: :quill_editor, hint: "Inserisci qui un blocco di testo lungo."
        # n_f.input :rich_text_small, label: "Testo Breve", as: :quill_editor, hint: "Inserisci qui un blocco di testo breve. Verrà visualizzato con un corpo testo e interlinea minori."
        n_f.input :video_provider, label: "Sorgente Video", as: :select, collection: [["Nessuno", 0], ["Vimeo", 1], ["YouTube", 2]], prompt: "Seleziona sorgente video", hint: "Indica se il video proviene da YouTube o da Vimeo."
        n_f.input :video_link, label: "Codice Video", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://vimeo.com/123456789 -> 123456789 | https://www.youtube.com/watch?v=123456789 -> 123456789"
        n_f.input :video_description, label: "Caption Video", hint: "Inserisci qui una descrizione di accompagnamento al video."
        n_f.input :image_url, label: "Immagine", as: :file, :image_preview => true
        n_f.input :image_description, label: "Caption Immagine", hint: "Inserisci qui una descrizione di accompagnamento al video."
        n_f.input :image_width, label: "Larghezza Immagine", as: :select, collection: [["20% - 1/5", "one_fifth"],["25% - 1/4", "one_fourth"],["33% - 1/3", "one_third"],["50% - 1/2", "half"],["66% - 2/3", "two_thirds"], ["75% - 3/4", "three_fourths"], ["100%", "full"]], prompt: "Seleziona layout", hint: "Di default le immagini vengono visualizzate al 100% della larghezza."
        # n_f.input :image_set, label: "Nome gruppo di immagini", as: :select, collection: [["Nessuno", " "], ["Gruppo 1", "c1"],["Gruppo 2", "c2"]], prompt: "Seleziona gruppo di appartenenza", hint: "Associa le immagini in gruppi per includerle nello stesso carosello."
        n_f.input :instagram_link, label: "Codice Post — Instagram", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://www.instagram.com/p/123456789 -> 123456789"
        # n_f.input :audio_provider, label: "Sorgente Audio", as: :select, collection: [["Nessuno", 0], ["SoundCloud", 1], ["MixCloud", 2], ["Spotify", 3]], prompt: "Seleziona sorgente audio", hint: "Indica se il video proviene da SoundCloud, MixCloud o Spotify."
        n_f.input :soundcloud_link, label: "Codice Audio", hint: "Inserire il codice URI identificativo della traccia. Solitamente si trova sotto Share > Embed"
      end
    end
    f.actions
  end  
end
