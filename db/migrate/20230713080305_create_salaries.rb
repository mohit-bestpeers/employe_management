class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.string :increment , default: '0'
      t.string :package
      t.string :total_salary
      t.string :salary_amount
      t.datetime :salary_month
      t.integer :total_leave , default: 0

      t.timestamps
    end
  end
end
