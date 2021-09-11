class SpecialProjectBlock < ApplicationRecord
  belongs_to :speciale_project

  mount_uploader :image, SpecialProjectImageUploader
  acts_as_list
end
