class ChangeExperienceToBeDecimalInEmployees < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :experience, :decimal
  end
end
