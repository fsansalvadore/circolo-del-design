class Article < ApplicationRecord
  validates :title, :subtitle, presence: true
  validates :priority, numericality: { only_integer: true }
  has_many :article_sections,   dependent: :destroy
  accepts_nested_attributes_for :article_sections,  allow_destroy: true
  acts_as_taggable_on :tags

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :cover, ArticleImageUploader
end
