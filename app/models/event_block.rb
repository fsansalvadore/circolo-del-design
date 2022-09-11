class EventBlock < ApplicationRecord
  belongs_to :event

  enum link_style: {
    button: 0,
    text: 1
  }

  mount_uploader :image_url, ImageUploader
  acts_as_list
end
