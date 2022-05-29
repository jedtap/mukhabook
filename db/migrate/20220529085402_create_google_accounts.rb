class CreateGoogleAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :google_accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
