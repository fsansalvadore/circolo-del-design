class AddFormActionToContentBlocks < ActiveRecord::Migration[5.2]
  def change
    add_column :content_blocks, :form_action, :string
  end
end
