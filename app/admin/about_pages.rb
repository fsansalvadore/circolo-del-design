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

  config.comments = false
  actions :all, :except => [:destroy]
  
  controller do
    def index
      redirect_to admin_about_page_path(AboutPage.all.first)
    end
  end
end
