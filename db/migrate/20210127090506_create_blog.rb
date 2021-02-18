class CreateBlog < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :author
      t.string :root_url
      t.string :content

      t.string :hash
      t.timestamps
    end
  end
end
