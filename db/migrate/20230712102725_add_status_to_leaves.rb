class AddStatusToLeaves < ActiveRecord::Migration[7.0]
  def change
    add_column :leaves, :From_session, :integer , default: 0
    add_column :leaves, :to_session, :integer , default: 0
    add_column :leaves, :status, :integer , default: 0
  end
end
