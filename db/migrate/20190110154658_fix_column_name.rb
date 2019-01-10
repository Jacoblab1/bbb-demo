class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :meetings, :recordings, :recording
  end
end
