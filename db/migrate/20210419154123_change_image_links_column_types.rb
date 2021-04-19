class ChangeImageLinksColumnTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :page_homes, :box_link_1_presence,  :boolean, using: 'box_link_1_presence::boolean'
    change_column :page_homes, :box_link_1_target,    :boolean, using: 'box_link_1_target::boolean'
    change_column :page_homes, :box_link_2_presence,  :boolean, using: 'box_link_2_presence::boolean'
    change_column :page_homes, :box_link_2_target,    :boolean, using: 'box_link_2_target::boolean'
    change_column :page_homes, :box_link_3_presence,  :boolean, using: 'box_link_3_presence::boolean'
    change_column :page_homes, :box_link_3_target,    :boolean, using: 'box_link_3_target::boolean'
  end
end
