class AddModPwToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :modPW, :string
  end
end
