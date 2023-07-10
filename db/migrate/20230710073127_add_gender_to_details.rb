class AddGenderToDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :details, :gender, :string
    add_column :details, :blood_group, :string
  end
end
