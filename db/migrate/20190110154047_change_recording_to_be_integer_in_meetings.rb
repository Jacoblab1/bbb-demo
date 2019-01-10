class ChangeRecordingToBeIntegerInMeetings < ActiveRecord::Migration[5.2]
  def change
    change_column :meetings, :recordings, :integer
  end
end
