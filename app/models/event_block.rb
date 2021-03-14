class EventBlock < ApplicationRecord
  belongs_to :event

  mount_uploader :image, ImageUploader
  acts_as_list
end
