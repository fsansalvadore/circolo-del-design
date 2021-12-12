ActiveAdmin.register EventBlock do
  belongs_to :event
  config.sort_order = 'position_asc'
end
