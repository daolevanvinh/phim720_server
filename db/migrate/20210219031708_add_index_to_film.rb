class AddIndexToFilm < ActiveRecord::Migration[5.2]
  def change
    change_column :episodes, :index, 'integer USING CAST(index AS integer)'
  end
end
