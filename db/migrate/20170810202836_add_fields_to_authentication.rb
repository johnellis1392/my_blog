class AddFieldsToAuthentication < ActiveRecord::Migration[5.1]
  def change
    add_column :authentications, :provider, :string
    add_column :authentications, :uid, :string
  end
end
