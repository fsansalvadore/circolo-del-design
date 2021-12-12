ActiveAdmin.register ArticleSection do
  belongs_to :article
  config.sort_order = 'position_asc'
end
