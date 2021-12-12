class Collaborator < ApplicationRecord
  validates :nome, :cognome, :image, presence: true

  mount_uploader :image, TeamMemberImageUploader
  acts_as_list
end
