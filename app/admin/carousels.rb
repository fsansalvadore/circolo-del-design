ActiveAdmin.register Carousel do
  menu parent: 'Media', label: 'Caroselli'

  permit_params :name,
                :description,
                :published,
                :position,
                :published_at,
                images_attributes: [
                  :id,
                  :src,
                  :alt,
                  :label,
                  :preferences,
                  :position,
                  :_destroy
                ]

  config.comments = false

  member_action :publish, method: :put do
    carousel = Carousel.find(params[:id])
    carousel.update(is_published: true, published_at: DateTime.now())
    redirect_to admin_carousels_path
  end

  member_action :unpublish, method: :put do
    carousel = Carousel.find(params[:id])
    carousel.update(is_published: false, published_at: nil)
    redirect_to admin_carousels_path
  end

  index do
    selectable_column
    column "Titolo" do |carousel|
      link_to carousel.name, admin_carousel_path(carousel)
    end
    column :slug
    column "Data di creazione", :created_at
    column "Data ultimo aggiornamento", :updated_at
    column "Pubblicato", :is_published
    column "Data di pubblicazione", :published_at
    column "Pubblica" do |carousel|
      if !carousel.is_published
        link_to "Pubblica", publish_admin_carousel_path(carousel), method: :put
      else
        link_to "Metti offline", unpublish_admin_carousel_path(carousel), method: :put
      end
    end
    actions
  end

  show name: :name do
    columns do
      column do
        attributes_table :name => "Info" do
          row :name
          row :description
        end
      end
      column do
        attributes_table :name => "Attività" do
          row :is_published
          row :published_at
          row :created_at
          row :updated_at
        end
      end
    end
  end

  # enable image deletion
  member_action :delete_image, method: :delete do
    @img = Cloudinary::CarrierWave.find(params[:id])
    @img.purge_later
    redirect_back(fallback_location: edit_admin_carousel_path(params[:id]))
  end
  
  form do |f|
    f.actions
    f.semantic_errors *f.object.errors.keys
    f.inputs "Carosello" do
      f.input :name, label: "Titolo"
      f.input :description, label: "Descrizione"
    end
    f.inputs 'Slides' do
      f.has_many :images, heading: "Immagini", allow_destroy: true, sortable: :position, sortable_start: 1 do |n_f|
        n_f.input :src, label: "Immagine", label: "Immagine", as: :file, :image_preview => true
        n_f.input :alt, label: "Alt_text", hint: "Testo descrittivo dell'immagine per fini di accessibilità. Viene letto da non vedenti e compare nel caso l'immagine non venga caricata."
        # n_f.input :label, label: "Testo", hint: "Testo di accompagnamento all'immagine, se presente."
      end
    end
    f.actions
  end
end
