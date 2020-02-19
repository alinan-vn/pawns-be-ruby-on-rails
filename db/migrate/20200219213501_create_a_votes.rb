class CreateAVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :a_votes do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
