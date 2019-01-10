class RenameRecordToRecording < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :record, :recordings
  end
end
