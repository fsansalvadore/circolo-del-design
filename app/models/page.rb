class Page < ApplicationRecord
  # include Publishable
  validates :title, :slug, presence: true
  validates :priority, :lang, numericality: { only_integer: true }
  
  has_one :page_meta_datum, as: :metadatable, dependent: :destroy
  has_many :content_blocks, as: :contentable, dependent: :destroy
  
  accepts_nested_attributes_for :page_meta_datum, allow_destroy: true
  accepts_nested_attributes_for :content_blocks, allow_destroy: true
  
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :cover, ImageUploader
end
