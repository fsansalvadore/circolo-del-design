class AddEventReferenceToEventBlocks < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_blocks, :event, foreign_key: true
  end
end
