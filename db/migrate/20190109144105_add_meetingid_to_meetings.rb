class AddMeetingidToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :meetingid, :string
  end
end
