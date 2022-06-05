class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :address, :location
  end
end
