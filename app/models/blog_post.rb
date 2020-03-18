class BlogPost < ApplicationRecord
  validates :title, :subtitle, presence: true
  validates :priority, numericality: { only_integer: true }
  has_many :blog_post_videos
  accepts_nested_attributes_for :blog_post_videos, allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :cover, EventImageUploader
end
