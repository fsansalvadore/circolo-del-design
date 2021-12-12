class AddDefaultToEvents < ActiveRecord::Migration[5.2]
  def change
    change_column_default :events, :is_not_in_calendar, false
  end
end
