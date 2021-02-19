class AddThumbnailToFilm < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :thumbnail, :string
  end
end
