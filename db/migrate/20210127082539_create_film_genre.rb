class CreateFilmGenre < ActiveRecord::Migration[5.2]
  def change
    create_table :film_genres do |t|
      t.bigint :film_id
      t.bigint :genre_id

      t.timestamps
    end

    add_foreign_key :film_genres, :films
    add_foreign_key :film_genres, :genres

  end
end
