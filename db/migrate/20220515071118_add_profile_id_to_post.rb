class AddProfileIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :profile_id, :integer
    add_index :posts, :profile_id
  end
end
