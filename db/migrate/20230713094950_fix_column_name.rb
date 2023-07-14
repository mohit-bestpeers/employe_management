class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :salaries, :increment, :increment_package
  end
end
