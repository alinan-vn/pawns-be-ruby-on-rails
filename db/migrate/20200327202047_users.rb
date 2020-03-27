class Users < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :writer, :boolean, null: false, default: false
  end
end
