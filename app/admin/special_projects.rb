ActiveAdmin.register SpecialProject do
  menu label: "Progetti Speciali"

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
                :year

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
      link_to 'Duplica', clone_admin_special_project_path(special_project)
    end
  end

  member_action :clone, method: :get do
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
    f.actions
  end  
end
