ActiveAdmin.register ServicesPage do
  menu parent: 'Pagine', label: "Servizi", priority: 5

  permit_params :page_label,
                :meta_title,
                :meta_description,
                :meta_keywords,
                :meta_image,
                :heading,
                :subheading,
                :bg_color
end