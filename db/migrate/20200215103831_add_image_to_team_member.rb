class AddImageToTeamMember < ActiveRecord::Migration[5.2]
  def change
    add_column :team_members, :image, :string
  end
end
