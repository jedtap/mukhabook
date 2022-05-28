class AddColumnInterestsToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :interests, :string
  end
end
