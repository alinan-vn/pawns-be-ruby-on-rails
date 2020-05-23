class RemoveDateFromBlogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :blogs, :date
  end
end
