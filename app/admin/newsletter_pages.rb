ActiveAdmin.register NewsletterPage do
  menu parent: 'Pagine', label: 'Newsletter', priority: 5

  permit_params :heading,
                :subheading,
                :form_action,
                page_meta_datum_attributes: [
                  :id,
                  :meta_title,
                  :meta_description,
                  :meta_keywords,
                  :meta_image,
                  :_destroy
                ]

  config.comments = false
  actions :all, :except => [:destroy]
  
  # controller do
  #   def index
  #     redirect_to admin_newsletter_page_path(NewsletterPage.first)
  #   end
  # end

  show title: :heading do
    columns do
      column do
        attributes_table :title => "SEO" do
          row (:heading) { |home| raw(home.heading) }
          row (:subheading) { |home| raw(home.subheading) }
          row :form_action
        end
      end
    end
  end

  # enable image deletion
  member_action :delete_image, method: :delete do
    @img = Cloudinary::CarrierWave.find(params[:id])
    @img.purge_later
    redirect_back(fallback_location: edit_admin_workshop_path)
  end
  
  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab :heading do
        f.inputs "Heading" do
          f.input :heading, label: "Heading 1", as: :quill_editor
          f.input :subheading, label: "Sottotitolo", as: :quill_editor
        end
      end
      tab :meta do
        f.has_many :page_meta_datum, heading: "Meta Data", allow_destroy: true do |n_f|
          n_f.input :meta_title, label: "Meta Title", placeholder: 'Meta Title'
          n_f.input :meta_description, label: "Meta Description", placeholder: 'Meta Description'
          n_f.input :meta_keywords, label: "Meta Keywords", placeholder: 'Meta Keywords'
          n_f.input :meta_image, as: :file, label: "Meta Image", :image_preview => true
        end
      end
    end
    f.inputs 'Newsletter' do
      f.input :form_action, label: "Codice mailchimp"
    end
    f.actions
  end
end
