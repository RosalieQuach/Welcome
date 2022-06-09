class AddStreetnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :streetname, :string
  end
end
