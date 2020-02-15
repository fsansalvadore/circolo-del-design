class TeamMember < ApplicationRecord
  validates :nome, :cognome, :ruolo, presence: true

  mount_uploader :image, TeamMemberImageUploader
  acts_as_list
end
