class ChangePassword < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password, :password_digest
    rename_column :admins, :password, :password_digest

  end
end
