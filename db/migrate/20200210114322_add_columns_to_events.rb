class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :sotto_categoria, :string
    add_column :events, :curator, :string
  end
end
