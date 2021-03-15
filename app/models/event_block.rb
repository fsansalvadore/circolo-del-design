class EventBlock < ApplicationRecord
  belongs_to :event

  mount_uploader :image_url, ImageUploader
  acts_as_list
end
