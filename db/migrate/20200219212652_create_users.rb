class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :elo
      t.string :profile_pic
      t.string :profile_background
      t.string :bio

      t.timestamps
    end
  end
end
