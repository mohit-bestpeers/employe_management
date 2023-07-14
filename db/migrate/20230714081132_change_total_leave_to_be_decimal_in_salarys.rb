class ChangeTotalLeaveToBeDecimalInSalarys < ActiveRecord::Migration[7.0]
  def change
    change_column :salaries, :total_leave, :decimal
  end
end
