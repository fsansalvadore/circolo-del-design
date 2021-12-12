ActiveAdmin.register GlobalSetting do
  menu parent: 'Impostazioni', label: 'Globali', priority: 1
  
  permit_params :title,
                :site_title,
                :favicon,
                :meta_keywords,
                :meta_title,
                :meta_description,
                :meta_image,
                :facebook_url,
                :youtube_url,
                :instagram_url,
                :linkedin_url,
                :opening_hours,
                :address,
                :main_email,
                :main_tel

  config.comments = false
  actions :all, :except => [:destroy]
  
  controller do
    def index
      redirect_to admin_global_setting_path(GlobalSetting.all.first)
    end
  end

  # enable image deletion
  # member_action :delete_image, method: :delete do
  #   @img = Cloudinary::CarrierWave.find(params[:id])
  #   @img.purge_later
  #   redirect_back(fallback_location: edit_admin_global_setting_path)
  # end
  
  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    f.input :title, label: "Titolo pagina admin"
      tabs do
        tab :website do
          f.inputs "Sito" do
            f.input :site_title, label: "Titolo del Sito"
            f.input :favicon, as: :file, label: "Favicon", hint: ".png - Dimensioni consigliate: 256px.", :image_preview => true
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
        tab :social do
          f.inputs 'Social' do
            f.input :facebook_url, label: "Facebook"
            f.input :instagram_url, label: "Instagram"
            f.input :linkedin_url, label: "Linkedin"
            f.input :youtube_url, label: "YouTube"
          end
        end
        tab :info do
          f.inputs 'Info' do
            f.input :main_email, label: "Email principale"
            f.input :main_tel, label: "Telefono principale"
            f.input :address, label: "Indirizzo"
            f.input :opening_hours, label: "Orari"
          end
        end
    end
    f.actions
  end
  
end
