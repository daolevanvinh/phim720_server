class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :name
      t.string :password
      t.string :email

      t.boolean :vip
      t.timestamp :expired_vip

      t.timestamps
    end
  end
end
