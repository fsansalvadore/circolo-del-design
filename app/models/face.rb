class Face < ApplicationRecord
  validates :cognome, :categoria, :image, presence: true
  mount_uploader :image, EventImageUploader
end
