class ChangeDaysToBeDecimalInLeaves < ActiveRecord::Migration[7.0]
  def change
    change_column :leaves, :days, :decimal
  end
end
