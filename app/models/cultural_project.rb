class CulturalProject < ApplicationRecord
    validates :title, presence: true
    mount_uploader :cover,       ImageUploader
    mount_uploader :intro_image, ImageUploader

    extend FriendlyId
    friendly_id :title, use: :slugged
end
