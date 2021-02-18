class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :type
      t.bigint :comment_id

      t.timestamps
    end

    add_foreign_key :comments, :comments
  end
end
