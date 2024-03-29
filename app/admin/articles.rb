ActiveAdmin.register Article do

  menu parent: 'WPAC', label: 'Articoli'

  permit_params :title,
                :subtitle,
                :cover,
                :project_title,
                :project_studio,
                :media_type,
                :meta_keywords,
                :meta_title,
                :meta_description,
                :lang,
                :translation_link,
                :publish_date,
                :published,
                :priority,
                :slug,
                tag_list: [],
                article_sections_attributes: [
                  :id,
                  :title,
                  :visible,
                  :rich_text,
                  :rich_text_small,
                  :image,
                  :image_description,
                  :image_width,
                  :image_set,
                  :video_provider,
                  :video_link,
                  :video_description,
                  :instagram_link,
                  :audio_provider,
                  :soundcloud_link,
                  :position,
                  :_destroy
                ]

  config.comments = false
  config.sort_order = 'created_at_desc'

  controller do
    defaults :finder => :find_by_slug
  end

  member_action :publish_article, method: :put do
    article = Article.friendly.find_by_slug(params[:id])
    article.update(published: true)
    redirect_to admin_article_path(article)
  end

  member_action :unpublish_article, method: :put do
    article = Article.friendly.find_by_slug(params[:id])
    article.update(published: false)
    redirect_to admin_article_path(article)
  end

  action_item only: :show do
    link_to "Anteprima live", wpac_article_path(article)
  end

  # action_item :publish, only: :show do
  #   link_to "Pubblica", publish_admin_article_path(article), method: :put if !article.published
  # end

  # action_item :unpublish, only: :show do
  #   link_to "Metti offline", unpublish_admin_article_path(article), method: :put if article.published
  # end

  member_action :publish, method: :put do
    article = Article.friendly.find_by_slug(params[:id])
    article.update(published: true)
    redirect_to admin_articles_path
  end

  member_action :unpublish, method: :put do
    article = Article.friendly.find_by_slug(params[:id])
    article.update(published: false)
    redirect_to admin_articles_path
  end

  index do
    selectable_column
    column "Titolo" do |article|
      link_to article.title, admin_article_path(article)
    end
    column "Media", :media_type
    list_column "Temi", :tag_list, class: "admin_tag"
    column "Lingua" do |article|
      case article.lang
      when 1
        # "Italiano"
        image_tag("lang_ita.svg", class: "admin_lang_icon")
      when 2
        # "Inglese"
        image_tag("lang_eng.svg", class: "admin_lang_icon")
      else
        "-"
      end
    end
    toggle_bool_column "Pubblicato", :published
    actions defaults: true do |article|
      link_to 'Duplica', clone_article_admin_article_path(article)
    end
  end

  member_action :clone_article, method: :get do
    @article_sections = ArticleSection.where(article_id: resource.id)
    @article = resource.dup
    @article.save!
    @article_sections.each do |section|
      dup_section = section.dup
      dup_section.article_id = @article.id
      dup_section.save!
    end
    redirect_to admin_articles_path
  end

  show title: :title do
    columns do
      column do
        attributes_table do
          row :slug
          row :media_type
          list_row :tag_list, class: "admin_tag"
          row :title
          row (:subtitle) { |article| raw(article.subtitle) }
          row "Lingua" do |article|
          case article.lang
            when 1
              # "Italiano"
              image_tag("lang_ita.svg", class: "admin_lang_icon")
            when 2
              # "Inglese"
              image_tag("lang_eng.svg", class: "admin_lang_icon")
            else
              "-"
            end
          end

          row :cover do |article|
            if article.cover && !article.cover.file.nil?
              image_tag(cl_image_path(article.cover), class: "image-preview")
            end
          end
        end
      end
      column do
        attributes_table :title => "Pubblicazione" do
          row :publish_date
          row :published
        end
        attributes_table :title => "SEO" do
          row :meta_title
          row :meta_description
          row :meta_keywords
        end
        attributes_table :title => "Attività" do
          row("Data creazione") {|a| a.created_at}
          row("Ultima modifica") {|a| a.updated_at}
        end
      end
    end
  end

  filter :title
  filter :base_tags
  filter :media_type
  filter :published

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab :article do
        f.inputs "Informazioni dell'Articolo" do
          f.input :published, label: "Pubblicato"
          f.input :publish_date, as: :date_time_picker, label: "Data di Pubblicazione"
          f.input :tag_list, label: "Temi", as: :check_boxes, collection: ArticleTheme.where(published: true).map {|theme| theme.nome}
          f.input :media_type, label: "Tipologia di Media", as: :select, collection: [["Interviste", "Interviste"], ["Audio", "Audio"], ["Progetti", "Progetti"], ["Libri", "Libri"], ["Video", "Video"]], prompt: "Seleziona una tipologia"
          f.input :priority, label: "Priorità", as: :select, collection: [["1 — In Evidenza", 1], ["2 — Secondo", 2], ["3 — Terzo", 3], ["4 — Quarto", 4], ["5 — Non mostrare in Home Page", 5],["Non mostrare nel blog", 6]], prompt: "Seleziona l'ordine in Home Page", hint: "I post in Home Page vengono mostrati in ordine di Priorirà (da 1 a 4) o per data di creazione. I post con priorità 5 non compaiono in Home Page, quelli con 6 non compaiono nel blog."

          f.input :title, label: "Titolo", placeholder: 'Titolo', hint: "Obbligatorio."
          f.input :subtitle, label: "Sottotitolo", as: :quill_editor, placeholder: 'Sottotitolo', hint: "Obbligatorio — Max 140 caratteri"
          f.input :cover, as: :file, :image_preview => true, hint: "Obbligatorio."
        end
      end
      tab :progetto do
        f.inputs 'Dettagli progetto' do
          f.input :project_studio, label: "Nome Studio", placeholder: 'Nome dello studio', hint: "Compare soltanto nei progetti."
          f.input :project_title, label: "Titolo Progetto", as: :quill_editor, placeholder: 'Titolo del progetto', hint: "Compare soltanto nei progetti e sarà visibile sull'immagine di anteprima dell'articolo."
        end
      end
      tab :meta do
        f.inputs 'Meta Data' do
          f.input :meta_title, label: "Meta Title", placeholder: 'Meta Title', hint: "Aggiungi un meta title al post."
          f.input :meta_description, label: "Meta Description", placeholder: 'Meta Description', hint: "Aggiungi una meta description al post."
          f.input :meta_keywords, label: "Meta Keywords", placeholder: 'Inserisci parole chiave', hint: "Le keywords devono essere separate da una virgola."
        end
      end
      tab :lingua do
        f.inputs 'Impostazioni Lingua' do
          f.input :lang, label: "Lingua Post", as: :select, collection: [["Italiano", 1], ["Inglese", 2]], prompt: "Seleziona lingua", hint: "Seleziona la lingua del post"
          f.input :translation_link, label: "Link alla traduzione", as: :select, collection: Article.all.map {|article| ["#{article.title} - #{article.lang == 1 ? "ITA" : "ENG"}", wpac_article_path(article)]}, prompt: "Seleziona la traduzione corrispondente.", hint: "Seleziona dalla lista la traduzione corrispondente a questo post."
        end
      end
      f.inputs "Sezioni — Ogni sezione corrisponde a una tipologia di contenuto diverso: Testo / Video / Immagine / Post Instagram / SoundCloud" do
        f.has_many :article_sections, heading: "Sezioni dell'articolo", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
          n_f.input :title, label: "Titolo Sezione", hint: "Facoltativo: Dare un titolo alla sezione può servire ad identificarla più facilmente."
          n_f.input :visible, label: "Visibilità Sezione", hint: "Togli la spunta 'visibile' se vuoi omettere momentaneamente questa sezione."

          n_f.input :rich_text, label: "Testo Lungo", as: :quill_editor, hint: "Inserisci qui un blocco di testo lungo."
          n_f.input :rich_text_small, label: "Testo Breve", as: :quill_editor, hint: "Inserisci qui un blocco di testo breve. Verrà visualizzato con un corpo testo e interlinea minori."
          n_f.input :video_provider, label: "Sorgente Video", as: :select, collection: [["Nessuno", 0], ["Vimeo", 1], ["YouTube", 2]], prompt: "Seleziona sorgente video", hint: "Indica se il video proviene da YouTube o da Vimeo."
          n_f.input :video_link, label: "Codice Video", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://vimeo.com/123456789 -> 123456789 | https://www.youtube.com/watch?v=123456789 -> 123456789"
          n_f.input :video_description, label: "Caption Video", hint: "Inserisci qui una descrizione di accompagnamento al video."
          n_f.input :image, label: "Immagine", as: :file, :image_preview => true
          n_f.input :image_description, label: "Caption Immagine", hint: "Inserisci qui una descrizione di accompagnamento al video."
          n_f.input :image_width, label: "Larghezza Immagine", as: :select, collection: [["20% - 1/5", "one_fifth"],["25% - 1/4", "one_fourth"],["33% - 1/3", "one_third"],["50% - 1/2", "half"],["66% - 2/3", "two_thirds"], ["75% - 3/4", "three_fourths"], ["100%", "full"]], prompt: "Seleziona layout", hint: "Di default le immagini vengono visualizzate al 100% della larghezza."
          n_f.input :image_set, label: "Nome gruppo di immagini", as: :select, collection: [["Nessuno", " "], ["Gruppo 1", "c1"],["Gruppo 2", "c2"]], prompt: "Seleziona gruppo di appartenenza", hint: "Associa le immagini in gruppi per includerle nello stesso carosello."
          n_f.input :instagram_link, label: "Codice Post — Instagram", hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://www.instagram.com/p/123456789 -> 123456789"
          n_f.input :audio_provider, label: "Sorgente Audio", as: :select, collection: [["Nessuno", 0], ["SoundCloud", 1], ["MixCloud", 2], ["Spotify", 3]], prompt: "Seleziona sorgente audio", hint: "Indica se il video proviene da SoundCloud, MixCloud o Spotify."
          n_f.input :soundcloud_link, label: "Codice Audio", hint: "Inserire il codice URI identificativo della traccia. Solitamente si trova sotto Share > Embed"
        end
      end
    end
    f.actions
  end

end
