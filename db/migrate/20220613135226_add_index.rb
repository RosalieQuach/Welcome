class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :location
  end
end
