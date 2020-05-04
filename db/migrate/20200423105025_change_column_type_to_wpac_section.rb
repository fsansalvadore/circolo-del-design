class ChangeColumnTypeToWpacSection < ActiveRecord::Migration[5.2]
  def change
    change_column :wpac_sections, :support_banner_link, :string
  end
end
