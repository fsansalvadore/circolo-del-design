class AddLinkToSpecialProjectBlock < ActiveRecord::Migration[5.2]
  def change
    add_column :special_project_blocks, :link_url, :string
  end
end
