class Event < ApplicationRecord
  validates :titolo, :sottotitolo, :data_inizio, :data_fine, :descrizione, :categoria, presence: true
  validates :priority, numericality: { only_integer: true }
  attribute :prezzo, :string, default: "Gratuito per i soci"

  extend FriendlyId
  friendly_id :titolo, use: :slugged
  # has_one_attached :photo
  mount_uploader :image, EventImageUploader

end
