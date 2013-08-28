class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.belongs_to :category
      t.string  :title
      t.string  :description
      t.decimal :price
      t.string  :email
      t.string  :edit_key
      t.timestamps
    end
  end
end
