ActiveAdmin.register MembershipsPage do
    menu parent: 'Pagine', label: "Membership", priority: 3
  
    permit_params :page_label,
                  :meta_title,
                  :meta_description,
                  :meta_keywords,
                  :meta_image,
                  :heading,
                  :subheading,
                  :content
  end
  
