class GlobalSetting < ApplicationRecord
    validates :title, presence: true

    mount_uploader :favicon, ImageUploader
    mount_uploader :meta_image, ImageUploader
end
