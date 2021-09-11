class SpecialProject < ApplicationRecord
    validates :title, presence: true
    has_many :special_project_blocks,   dependent: :destroy
    accepts_nested_attributes_for :special_project_blocks,  allow_destroy: true
    
    extend FriendlyId
    friendly_id :title, use: :slugged

    mount_uploader :cover,       SpecialProjectImageUploader
    mount_uploader :intro_image, SpecialProjectImageUploader
end
