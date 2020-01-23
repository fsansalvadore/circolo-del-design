class Event < ApplicationRecord
  validates :titolo, :sottotitolo, :data_inizio, :data_fine, :descrizione, presence: true
  # has_one_attached :photo
  mount_uploader :image, EventImageUploader

end
