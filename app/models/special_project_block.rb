class SpecialProjectBlock < ApplicationRecord
  belongs_to :special_project

  mount_uploader :image_url, SpecialProjectImageUploader
  acts_as_list
end
