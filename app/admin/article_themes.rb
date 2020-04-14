ActiveAdmin.register ArticleTheme do
  menu parent: 'WPAC', label: 'Temi', priority: 1

  permit_params :nome, :published
  config.comments = false

  # scope :pubblicati, ->{where(published: true)}
  # scope :bozze, ->{where(published: false)}
  config.sort_order = 'created_at_asc'

  member_action :publish_article_theme, method: :put do
    article_theme = ArticleTheme.find(params[:id])
    article_theme.update(published: true)
    redirect_to admin_article_theme_path(article_theme)
  end

  member_action :unpublish_article_theme, method: :put do
    article_theme = ArticleTheme.find(params[:id])
    article_theme.update(published: false)
    redirect_to admin_article_theme_path(article_theme)
  end

  action_item :publish, only: :show do
    link_to "Pubblica", publish_admin_article_theme_path(article_theme), method: :put if !article_theme.published
  end

  action_item :unpublish, only: :show do
    link_to "Metti offline", unpublish_admin_article_theme_path(article_theme), method: :put if article_theme.published
  end

  member_action :publish, method: :put do
    article_theme = ArticleTheme.find(params[:id])
    article_theme.update(published: true)
    redirect_to admin_article_themes_path
  end

  member_action :unpublish, method: :put do
    article_theme = ArticleTheme.find(params[:id])
    article_theme.update(published: false)
    redirect_to admin_article_themes_path
  end

  index do
    selectable_column
    column "Nome Tema" do |article_theme|
      link_to article_theme.nome, admin_article_theme_path(article_theme)
    end
    column :published
    column "Pubblica" do |article_theme|
      if !article_theme.published
        link_to "Pubblica", publish_admin_article_theme_path(article_theme), method: :put
      else
        link_to "Metti offline", unpublish_admin_article_theme_path(article_theme), method: :put
      end
    end
    actions defaults: true do |article_theme|
      link_to 'Duplica', clone_admin_article_theme_path(article_theme)
    end
  end

  member_action :clone, method: :get do
    @article_theme = resource.dup
    @article_theme.save!
    redirect_to admin_article_themes_path
  end

  show title: :nome do
    attributes_table do
      row :nome
      row :published
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'ArticleTheme' do
      f.input :nome, placeholder: 'Nome Tema', hint: "Inserisci il nome del tema. (Obbligatorio — Preferibilmente max 20 caratteri)"
      f.input :published, hint: "Puoi tenere alcuni temi in bozza per nasconderli momentaneamente dal menu."
    end
    f.actions
  end

end
