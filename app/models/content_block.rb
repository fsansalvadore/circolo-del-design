# Polymorphic
class ContentBlock < ApplicationRecord
  enum kind: {
    testo: 0,
    immagine: 1,
    video: 2,
    instagram: 3,
    audio: 4,
    link: 5,
    mailchimp: 6
  }

  belongs_to :contentable, polymorphic: true

  mount_uploader :image, ImageUploader
end
