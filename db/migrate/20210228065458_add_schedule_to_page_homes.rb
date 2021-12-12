class AddScheduleToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :info_section_presence,           :boolean
    add_column :page_homes, :info_section_schedule_presence,  :boolean
    add_column :page_homes, :info_section_address_presence,   :boolean
    add_column :global_settings, :address, :string
  end
end
