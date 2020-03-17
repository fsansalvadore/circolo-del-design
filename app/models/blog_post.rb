class BlogPost < ApplicationRecord
  validates :title, :subtitle, :content, presence: true
  validates :priority, numericality: { only_integer: true }

  extend FriendlyId
  friendly_id :title, use: :slugged

  # has_one_attached :photo
  mount_uploader :cover, EventImageUploader
end
