class Collaborator < ApplicationRecord
  validates :nome, :cognome, presence: true

  mount_uploader :image, TeamMemberImageUploader
  acts_as_list
end
