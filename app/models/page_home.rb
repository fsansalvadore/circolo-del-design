class PageHome < ApplicationRecord
    has_many :home_page_cards,      dependent: :destroy
    has_many :home_page_links,                dependent: :destroy
    has_many :home_page_column_one_links,                dependent: :destroy
    has_many :home_page_column_two_links,                dependent: :destroy
    has_many :home_page_column_three_links,                dependent: :destroy
    accepts_nested_attributes_for :home_page_cards, allow_destroy: true
    accepts_nested_attributes_for :home_page_links,           allow_destroy: true
    accepts_nested_attributes_for :home_page_column_one_links,           allow_destroy: true
    accepts_nested_attributes_for :home_page_column_two_links,           allow_destroy: true
    accepts_nested_attributes_for :home_page_column_three_links,           allow_destroy: true

    mount_uploader :meta_image, ImageUploader
    mount_uploader :splash_bg_img, ImageUploader
    mount_uploader :splash_bg_img_mobile, ImageUploader
    mount_uploader :splash_content_img, ImageUploader
    mount_uploader :splash_content_img_mobile, ImageUploader
    mount_uploader :hero_image, ImageUploader
    mount_uploader :banner_img_desktop, ImageUploader
    mount_uploader :banner_img_mobile, ImageUploader
    mount_uploader :box_link_1_image, ImageUploader
    mount_uploader :box_link_2_image, ImageUploader
    mount_uploader :box_link_3_image, ImageUploader
end
