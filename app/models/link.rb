class Link < ApplicationRecord
    belongs_to :page_home
    acts_as_list
end
