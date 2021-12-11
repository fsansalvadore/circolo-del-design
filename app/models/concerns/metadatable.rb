module Metadatable
  has_one :page_meta_data, as: :metadatable, dependent: :destroy
end