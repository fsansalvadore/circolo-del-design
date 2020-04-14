class ArticleSection < ApplicationRecord
  belongs_to :article

  mount_uploader :image, ArticleImageUploader
  acts_as_list
end
