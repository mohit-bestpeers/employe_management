class AddLeaveTypeToLeaves < ActiveRecord::Migration[7.0]
  def change
    add_column :leaves, :leave_type, :integer ,default: 0
  end
end
