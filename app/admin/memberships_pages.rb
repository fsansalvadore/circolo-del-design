ActiveAdmin.register MembershipsPage do
    menu parent: 'Pagine', label: "Progetti d'Impatto", priority: 3
  
    permit_params :page_label,
                  :meta_title,
                  :meta_description,
                  :meta_keywords,
                  :meta_image,
                  :heading,
                  :subheading,
                  :content
  end
  
