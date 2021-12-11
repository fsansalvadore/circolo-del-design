class ContentBlock < ApplicationRecord
  belongs_to :contentable, polymorphic: true, dependent: :destroy

  mount_uploader :image, ImageUploader
end
