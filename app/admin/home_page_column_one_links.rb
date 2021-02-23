ActiveAdmin.register HomePageColumnOneLink do
  belongs_to :page_home
  config.sort_order = 'position_asc'
end
  