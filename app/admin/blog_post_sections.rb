ActiveAdmin.register BlogPostSection do
  belongs_to :blog_post

  config.sort_order = 'position_asc'

  index do
    selectable_column
    handle_column
    column :section_title
    column :published

    actions
  end
end
