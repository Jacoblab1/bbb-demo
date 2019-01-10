class AddRecordToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :record, :boolean
  end
end
