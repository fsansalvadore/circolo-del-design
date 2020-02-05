class AddPriorityToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :priority, :integer, default: 5
  end
end
