ActiveAdmin.register BlogCategory do
  menu parent: 'Blog', label: 'Rubriche', priority: 1

  permit_params :nome, :published
  config.comments = false

  # scope :pubblicati, ->{where(published: true)}
  # scope :bozze, ->{where(published: false)}
  config.sort_order = 'created_at_asc'

  member_action :publish_blog_category, method: :put do
    blog_category = BlogCategory.find(params[:id])
    blog_category.update(published: true)
    redirect_to admin_blog_category_path(blog_category)
  end

  member_action :unpublish_blog_category, method: :put do
    blog_category = BlogCategory.find(params[:id])
    blog_category.update(published: false)
    redirect_to admin_blog_category_path(blog_category)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_blog_category_path(blog_category), method: :put if !blog_category.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_blog_category_path(blog_category), method: :put if blog_category.published
  end

  member_action :publish, method: :put do
    blog_category = BlogCategory.find(params[:id])
    blog_category.update(published: true)
    redirect_to admin_blog_categoriess_path
  end

  member_action :unpublish, method: :put do
    blog_category = BlogCategory.find(params[:id])
    blog_category.update(published: false)
    redirect_to admin_blog_categoriess_path
  end

  index do
    selectable_column
    column "Nome" do |blog_category|
      link_to blog_category.nome, admin_blog_category_path(blog_category)
    end
    column :published
    column "Pubblica" do |blog_category|
      if !blog_category.published
        link_to "Pubblica", publish_admin_blog_category_path(blog_category), method: :put
      else
        link_to "Metti offline", unpublish_admin_blog_category_path(blog_category), method: :put
      end
    end
    actions defaults: true do |blog_category|
      link_to 'Duplica', clone_blog_category_admin_blog_category_path(blog_category)
    end
  end

  member_action :clone_blog_category, method: :get do
    @blog_category = resource.dup
    @blog_category.save!
    redirect_to admin_blog_categoriess_path
  end

  show title: :nome do
    attributes_table do
      row :nome
      row :published
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'BlogCategory' do
      f.input :nome, placeholder: 'Nome Rubrica', hint: "Inserisci il nome della rubrica. (Obbligatorio — Preferibilmente max 20 caratteri)"
      f.input :published, hint: "Puoi tenere alcune rubriche in bozza per nasconderle momentaneamente dal menu."
    end
    f.actions
  end
end
