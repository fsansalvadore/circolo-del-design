class PageHome < ApplicationRecord

    mount_uploader :meta_image, ImageUploader
    mount_uploader :splash_bg_img, ImageUploader
    mount_uploader :splash_content_img, ImageUploader
    mount_uploader :hero_image, ImageUploader
    mount_uploader :banner_img_desktop, ImageUploader
    mount_uploader :banner_img_mobile, ImageUploader
end
