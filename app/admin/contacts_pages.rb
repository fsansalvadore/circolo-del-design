ActiveAdmin.register ContactsPage do
  menu parent: 'Pagine', label: "Contatti", priority: 6

  permit_params :page_label,
                :meta_title,
                :meta_description,
                :meta_keywords,
                :meta_image,
                :heading,
                :subheading,
                :form_title,
                :form_subtitle,
                :address_left,
                :address_title,
                :address_subtitle,
                :map_image,
                :map_box_text,
                :cover_image
end
