class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :father_name
      t.string :mother_name
      t.date :date_of_birth
      t.string :contact
      t.string :emergency_contact
      t.string :skills
      t.string :date_of_joining
      t.string :present_address
      t.string :permanent_address
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
