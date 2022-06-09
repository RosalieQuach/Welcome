class AddStreetnumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :streetnumber, :string
  end
end
