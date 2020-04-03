class Face < ApplicationRecord
  validates :cognome, :image, presence: true
  mount_uploader :image, EventImageUploader

  extend FriendlyId
  friendly_id :cognome, use: :slugged
end
