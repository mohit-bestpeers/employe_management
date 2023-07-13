class ChangeLeaveTypeToBeIntegerInLeaves < ActiveRecord::Migration[7.0]
  def change
    remove_column :leaves, :leave_type, :string
  end
end
