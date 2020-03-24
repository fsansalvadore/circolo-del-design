class BlogPost < ApplicationRecord
  validates :title, :subtitle, :cover, presence: true
  validates :priority, numericality: { only_integer: true }
  has_many :blog_post_sections,   dependent: :destroy
  has_many :blog_post_videos,     dependent: :destroy
  has_many :blog_post_images,     dependent: :destroy
  has_many :post_instagrams,      dependent: :destroy
  has_many :post_text_longs,      dependent: :destroy
  has_many :post_text_shorts,     dependent: :destroy
  accepts_nested_attributes_for :blog_post_sections,  allow_destroy: true
  accepts_nested_attributes_for :blog_post_videos,    allow_destroy: true
  accepts_nested_attributes_for :blog_post_images,    allow_destroy: true
  accepts_nested_attributes_for :post_instagrams,     allow_destroy: true
  accepts_nested_attributes_for :post_text_longs,     allow_destroy: true
  accepts_nested_attributes_for :post_text_shorts,    allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :cover, EventImageUploader
end
