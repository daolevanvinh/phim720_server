class CreateFilm < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.string :description
      t.bigint :likes
      t.bigint :follows


      t.timestamps
    end
  end
end
