class Event < ApplicationRecord
  validates :titolo, :data_inizio, :data_fine, :categoria, :image, presence: true
  validates :priority, numericality: { only_integer: true }
  attribute :prezzo, :string, default: "Gratuito per i soci"

  has_many :event_blocks,   dependent: :destroy
  accepts_nested_attributes_for :event_blocks,  allow_destroy: true

  extend FriendlyId
  friendly_id :titolo, use: :slugged

  # has_one_attached :photo
  mount_uploader :image, EventImageUploader

end
