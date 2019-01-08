class AddAttPwToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :attPW, :string
  end
end
