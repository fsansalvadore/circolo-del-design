ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :immagine, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured
  #
  # or
  #
  # permit_params do
  #   permitted = [:titolo, :sottotitolo, :data_inizio, :data_fine, :orario, :prezzo, :descrizione, :immagine, :categoria, :luogo, :durata, :posti, :target, :link, :published, :featured]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
