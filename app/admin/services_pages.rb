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

  config.comments = false
  actions :all, :except => [:destroy]
                
  controller do
    def index
      redirect_to admin_services_page_path(ServicesPage.all.first)
    end
  end

  show title: :page_label do
    columns do
      column do
        attributes_table do
          row (:heading) { |service| raw(service.heading) }
          row (:subheading) { |service| raw(service.subheading) }
        end
      end
      column do
        attributes_table :title => "SEO" do
          row :meta_title
          row :meta_description
          row :meta_keywords
        end
      end
    end
  end

  # enable image deletion
  member_action :delete_image, method: :delete do
    @img = Cloudinary::CarrierWave.find(params[:id])
    @img.purge_later
    redirect_back(fallback_location: edit_admin_services_page_path)
  end
  
  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab :heading do
        f.inputs "Heading" do
          f.input :page_label, label: "Titolo Pagina", hint: "Compare come titolo della pagina in admin."
          f.input :heading, label: "Titolo"
          f.input :subheading, label: "Sottotitolo", as: :quill_editor
        end
      end
      tab :meta do
        f.inputs 'Meta Data' do
          f.input :meta_title, label: "Meta Title", placeholder: 'Meta Title'
          f.input :meta_description, label: "Meta Description", placeholder: 'Meta Description'
          f.input :meta_keywords, label: "Meta Keywords", placeholder: 'Meta Keywords'
          f.input :meta_image, as: :file, label: "Meta Image", :image_preview => true
        end
      end
    end
    f.actions
  end
end