class SpecialProject < ApplicationRecord
    validates :title, presence: true
    mount_uploader :cover,       SpecialProjectImageUploader
    mount_uploader :intro_image, SpecialProjectImageUploader

    extend FriendlyId
    friendly_id :title, use: :slugged
end
