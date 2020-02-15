class AddPublishedToTeamMember < ActiveRecord::Migration[5.2]
  def change
    add_column :team_members, :published, :boolean, default: false
  end
end
