class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :profile_id, :integer
    add_column :comments, :post_id, :integer
    add_column :comments, :body, :string

    add_index :comments, :profile_id
    add_index :comments, :post_id
  end
end
