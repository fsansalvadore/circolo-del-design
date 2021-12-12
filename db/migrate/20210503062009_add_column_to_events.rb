class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :is_not_in_calendar, :boolean
  end
end
