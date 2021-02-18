class AddLinksToEp < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :links, :string
  end
end
