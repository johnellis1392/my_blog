class AddAuthenticationsToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :authentications, :user, foreign_key: true
  end
end
