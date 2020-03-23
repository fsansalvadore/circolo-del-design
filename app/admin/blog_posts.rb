ActiveAdmin.register BlogPost do
  menu parent: 'Blog', label: 'Post'

  permit_params :rubrica,
                :intro,
                :title,
                # :title_integration,
                :subtitle,
                :cover,
                :meta_title,
                :meta_description,
                :keywords,
                :lang,
                :lang_link_eng,
                :publish_date,
                :published,
                :priority,
                :slug,
                blog_post_sections_attributes: [
                  :id,
                  :section_title,
                  :rich_text,
                  :rich_text_small,
                  :image,
                  :image_description,
                  :image_width,
                  :vimeo_link,
                  :vimeo_description,
                  :instagram_link,
                  :position,
                  :visible,
                  :_destroy
                ]

  config.comments = false
  config.sort_order = 'created_at_asc'

  controller do
    defaults :finder => :find_by_slug
  end

  member_action :publish_blog_post, method: :put do
    blog_post = BlogPost.friendly.find_by_slug(params[:id])
    blog_post.update(published: true)
    redirect_to admin_blog_post_path(blog_post)
  end

  member_action :unpublish_blog_post, method: :put do
    blog_post = BlogPost.friendly.find_by_slug(params[:id])
    blog_post.update(published: false)
    redirect_to admin_blog_post_path(blog_post)
  end

  action_item :publish, only: :show do
    link_to "Anteprima live", blog_post_path(blog_post)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_blog_post_path(blog_post), method: :put if !blog_post.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_blog_post_path(blog_post), method: :put if blog_post.published
  end

  member_action :publish, method: :put do
    blog_post = BlogPost.friendly.find_by_slug(params[:id])
    blog_post.update(published: true)
    redirect_to admin_blog_posts_path
  end

  member_action :unpublish, method: :put do
    blog_post = BlogPost.friendly.find_by_slug(params[:id])
    blog_post.update(published: false)
    redirect_to admin_blog_posts_path
  end

  index do
    selectable_column
    column "Titolo" do |blog_post|
      link_to blog_post.title, admin_blog_post_path(blog_post)
    end
    column :rubrica
    column "Lingua" do |blog_post|
      case blog_post.lang
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
    column :published
    column "Pubblica" do |blog_post|
      if !blog_post.published
        link_to "Pubblica", publish_admin_blog_post_path(blog_post), method: :put
      else
        link_to "Metti offline", unpublish_admin_blog_post_path(blog_post), method: :put
      end
    end
    actions defaults: true do |blog_post|
      link_to 'Duplica', clone_admin_blog_post_path(blog_post)
    end
  end

  member_action :clone, method: :get do
    @blog_post = resource.dup
    @blog_post.save!
    redirect_to admin_blog_posts_path
  end

  show title: :title do
    attributes_table do
      row :slug
      row :rubrica
      row :title
      row (:subtitle) { |blog_post| raw(blog_post.subtitle) }
      row :meta_title
      row :meta_description
      row :keywords
      row "Lingua" do |blog_post|
      case blog_post.lang
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
      row :cover do |i|
        if !blog_post.cover
          image_tag(cl_image_path(blog_post.cover), class: "image-preview")
        end
      end
      row :published
    end
  end

  filter :title
  filter :blog_column
  filter :published

  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Post' do
      f.input :rubrica, as: :select, :collection => BlogCategory.where(published: true).map{|c| c.nome}, prompt: "Seleziona una rubrica"

      f.input :title, placeholder: 'Titolo', hint: "Verrà usato automaticamente come Meta Title e nell'indirizzo URL della pagina. (Obbligatorio — Preferibilmente max 40 caratteri)"
      f.input :subtitle, as: :quill_editor, placeholder: 'Sottotitolo', hint: "Obbligatorio — Max 140 caratteri"
      f.input :cover, as: :file, :image_preview => true, hint: "Obbligatorio"
      f.input :meta_title, placeholder: 'Meta Title', hint: "Aggiungi un meta title al post."
      f.input :meta_description, placeholder: 'Meta Description', hint: "Aggiungi una meta description al post."
      f.input :keywords, placeholder: 'Inserisci parole chiave', hint: "Le keywords verranno usate nei meta-tag della pagina e devono essere separate da una virgola."
      f.input :lang, as: :select, collection: [["Italiano", 1], ["Inglese", 2]], prompt: "Seleziona lingua", hint: "Seleziona la lingua del post"
      f.input :lang_link_eng, as: :select, collection: BlogPost.all.map {|post| ["#{post.title} - #{post.lang == 1 ? "ITA" : "ENG"}", blog_post_path(post)]}, prompt: "Seleziona il post di cui è la traduzione.", hint: "Se questa è la traduzione inglese di un post, seleziona il post italiano da questa lista."
      f.input :priority, as: :select, collection: [["1 — In Evidenza", 1], ["2 — Secondo", 2], ["3 — Terzo", 3], ["4 — Quarto", 4], ["5 — Non mostrare in Home Page", 5],["Non mostrare nel blog", 6]], prompt: "Seleziona l'ordine in Home Page", hint: "I post in Home Page vengono mostrati in ordine di Priorirà (da 1 a 4) o per data di creazione. I post con priorità 5 non compaiono in Home Page, quelli con 6 non compaiono nel blog."
      f.input :published

      f.inputs "Sezioni — Ogni sezione corrisponde a una tipologia di contenuto diverso: testo / video / immagine / post instagram" do
        f.has_many :blog_post_sections, allow_destroy: true do |n_f|
          n_f.input :section_title, hint: "Questo campo serve per identificare la sezione e poterla riodrinare nella pagina riassuntiva del post."
          n_f.input :rich_text, as: :quill_editor, hint: "Inserisci qui un blocco di testo lungo."
          n_f.input :rich_text_small, as: :quill_editor, hint: "Inserisci qui un blocco di testo breve."
          n_f.input :vimeo_link, hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://vimeo.com/123456789 -> 123456789"
          n_f.input :vimeo_description, hint: "Inserisci qui una descrizione di accompagnamento al video."
          n_f.input :image, as: :file, :image_preview => true
          n_f.input :image_description, hint: "Inserisci qui una descrizione di accompagnamento al video."
          n_f.input :image_width, as: :select, collection: [["50%", "half"], ["100%", "full"]], prompt: "Seleziona layout", hint: "Di default le immagini vengono visualizzate al 100% della larghezza."
          n_f.input :instagram_link, hint: "Inserire soltanto il codice identificativo dell'url. Esempio: https://www.instagram.com/p/123456789 -> 123456789"
          n_f.input :position
          n_f.input :visible, hint: "Togli la spunta 'visibile' se vuoi omettere momentaneamente questa sezione."
        end
      end

    end
    f.actions
  end

end
