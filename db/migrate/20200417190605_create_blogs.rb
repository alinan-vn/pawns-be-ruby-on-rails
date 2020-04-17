class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :date
      t.string :author
      
      t.timestamps
    end
  end
end
