module Publishable
  extend ActiveSupport::Concern

  included do
    scope :is_draft, -> { where(is_published: false) }
    scope :is_published, -> { where(is_published: true) }
  end

  def publish
    update_attribute :is_published, true
  end
  
  def unpublish
    update_attribute :is_published, false
  end
end