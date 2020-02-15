class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
      t.string :nome
      t.string :cognome
      t.string :ruolo
      t.integer :order

      t.timestamps
    end
  end
end
