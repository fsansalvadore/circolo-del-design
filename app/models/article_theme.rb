class ArticleTheme < ApplicationRecord
  validates :nome, :subtitle, :abstract, presence: true
end
