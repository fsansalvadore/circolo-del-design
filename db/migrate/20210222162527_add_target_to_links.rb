class AddTargetToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :target, :boolean
  end
end
