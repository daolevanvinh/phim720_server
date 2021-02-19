class ChangeLinks < ActiveRecord::Migration[5.2]
  def change
    rename_column :episodes,:links, :link
  end
end
