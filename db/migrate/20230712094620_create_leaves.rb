class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.string :leave_type
      t.datetime :from_date
      t.datetime :to_date
      t.integer :days
      t.string :mail_to
      t.string :reason
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
