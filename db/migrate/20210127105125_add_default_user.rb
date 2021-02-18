class AddDefaultUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :vip, :boolean, :default => false
    change_column :users,:email_token, :string, :default => nil?
  end
end
