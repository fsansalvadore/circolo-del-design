ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :immagine, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured
  config.comments = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :immagine, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column "Titolo" do |event|
      link_to event.titolo, admin_event_path(event)
    end
    column :categoria
    column "Data inizio", :data_inizio, :sortable => :data_inizio
    column "Data fine", :data_fine
    column :published
    column :featured
    column "Anteprima" do |event|
      link_to "Visualizza", events_path(event)
    end

    actions
  end

  filter :titolo
  filter :data_inizio
  filter :data_fine
  filter :categoria
  filter :published
  filter :featured

  form do |f|
    f.inputs 'Event' do
      f.input :titolo
      f.input :sottotitolo
      f.input :data_inizio
      f.input :data_fine
      f.input :orario
      f.input :prezzo
      f.input :descrizione, as: :quill_editor
      f.input :immagine
      f.input :categoria
      f.input :luogo
      f.input :durata
      f.input :posti
      f.input :target
      f.input :link
      f.input :featured
      f.input :published
    end
    f.actions
  end
end
