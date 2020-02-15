class AddPositionToTeamMember < ActiveRecord::Migration[5.2]
  def change
    add_column :team_members, :position, :integer
  end
end
