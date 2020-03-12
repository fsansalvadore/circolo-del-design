class Face < ApplicationRecord
  validates :cognome, :image, presence: true
  mount_uploader :image, EventImageUploader
end
