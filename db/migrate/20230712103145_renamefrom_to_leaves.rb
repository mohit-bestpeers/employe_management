class RenamefromToLeaves < ActiveRecord::Migration[7.0]
  def change
    rename_column :leaves, :From_session, :from_session
  end
end
