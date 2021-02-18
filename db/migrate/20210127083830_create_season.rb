class CreateSeason < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :title
      t.bigint :film_id

      t.timestamps
    end
    add_foreign_key :seasons, :films
  end
end
