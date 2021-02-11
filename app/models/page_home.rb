class PageHome < ApplicationRecord

    mount_uploader :meta_image, ImageUploader
    mount_uploader :splash_bg_img, ImageUploader
    mount_uploader :splash_content_img, ImageUploader
end
