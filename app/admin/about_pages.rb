ActiveAdmin.register AboutPage do
  menu parent: 'Pagine', label: 'About Us', priority: 2

  permit_params :page_label,
                :meta_title,
                :meta_description,
                :meta_keywords,
                :meta_image,
                :heading,
                :subheading,
                :bg_color

end
