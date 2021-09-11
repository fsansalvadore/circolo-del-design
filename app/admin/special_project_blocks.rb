ActiveAdmin.register SpecialProjectBlock do
  belongs_to :special_project
  config.sort_order = 'position_asc'  
end
