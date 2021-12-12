class NewsletterPage < ApplicationRecord
  include Publishable
  
  has_one :page_meta_datum, as: :metadatable, dependent: :destroy
  accepts_nested_attributes_for :page_meta_datum, allow_destroy: true
end
