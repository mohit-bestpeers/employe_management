class AddEmployeeToSalarys < ActiveRecord::Migration[7.0]
  def change
    add_reference :salaries, :employee, null: false, foreign_key: true
  end
end
