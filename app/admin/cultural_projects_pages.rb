ActiveAdmin.register CulturalProjectsPage do
  menu parent: 'Pagine', label: "Progetti Culturali", priority: 4

  permit_params :page_label,
                :meta_title,
                :meta_description,
                :meta_keywords,
                :meta_image,
                :heading,
                :subheading,
                :bg_color
end
