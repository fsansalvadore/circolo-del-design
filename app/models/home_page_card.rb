class HomePageCard < ApplicationRecord
    belongs_to :page_home
    # validates :eventy_type_category, numericality: { only_integer: true }
    acts_as_list
    mount_uploader :image, ImageUploader
end
