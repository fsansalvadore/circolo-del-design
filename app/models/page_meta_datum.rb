class PageMetaDatum < ApplicationRecord
  belongs_to :metadatable, polymorphic: true, dependent: :destroy

  mount_uploader :meta_image, ImageUploader
end
