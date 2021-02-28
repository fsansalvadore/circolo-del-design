class GlobalSetting < ApplicationRecord
    validates :title, presence: true

    mount_uploader :favicon, ImageUploader
end
