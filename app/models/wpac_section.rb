class WpacSection < ApplicationRecord
  validates :title, presence: true
  validates_numericality_of :cover_filter_opacity,
    :less_than_or_equal_to => 100,
    :greater_than_or_equal_to => 0,
    :only_integer => true

  # mount_uploader :cover_image, WpacSectionImageUploader
  has_one_attached :cover_image
  mount_uploader :preview_img, WpacSectionImageUploader
end
