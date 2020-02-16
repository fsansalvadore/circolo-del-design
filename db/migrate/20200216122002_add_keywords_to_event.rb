class AddKeywordsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :keywords, :string
  end
end
