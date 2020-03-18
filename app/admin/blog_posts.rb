ActiveAdmin.register BlogPost do
  menu parent: 'Blog', label: 'Post'

  permit_params :rubrica ,:title, :subtitle, :cover, :keywords, :content, :publish_date, :published, :priority, :slug,
                  blog_categories_attributes: [:id, :nome]

  config.comments = false

  # scope :pubblicati, ->{where(published: true)}
  # scope :bozze, ->{where(published: false)}
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
    column :priority
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
      row :title
      row :subtitle
      row :slug
      row :keywords
      row :rubrica
      row :cover do |i|
        image_tag(cl_image_path(blog_post.cover), class: "image-preview")
      end
      row (:content) { |blog_post| raw(blog_post.content) }
      row :published
      row :publish_date
      row :priority
    end
  end

  filter :title
  filter :blog_column
  filter :published

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'BlogPost' do
      f.input :rubrica, as: :select, :collection => BlogCategory.where(published: true).map{|c| c.nome}, prompt: "Seleziona una rubrica"

      f.input :title, placeholder: 'Titolo', hint: "Verrà usato automaticamente come Meta Title e nell'indirizzo URL della pagina. (Obbligatorio — Preferibilmente max 40 caratteri)"
      f.input :subtitle, placeholder: 'Sottotitolo', hint: "Verrà anche utilizzato come Meta Description della pagina. (Obbligatorio — Max 140 caratteri)"
      f.input :cover, as: :file, :image_preview => true, hint: "Obbligatorio"
      f.input :keywords, placeholder: 'Inserisci parole chiave', hint: "Le keywords verranno usate nei meta-tag della pagina e devono essere separate da una virgola."
      f.input :publish_date, as: :datepicker, hint: "Puoi programmare quando il post verrà pubblicato."
      f.input :content, as: :quill_editor, hint: "Obbligatorio"
      f.input :published
      f.input :priority, as: :select, collection: [["1 — In evidenza", 1], ["2 — Secondo", 2], ["3 — Terzo", 3], ["4 — Quarto", 4], ["5 — Nessuna Priorità", 5]], prompt: "Seleziona l'ordine in Home Page", hint: "I post in Home Page vengono mostrati in ordine di Priorirà (da 1 a 4) o per Data d'inizio nel caso di stessa priorità. I post con priorità 5 non compaiono in Home Page."
    end
    f.actions
  end
end
