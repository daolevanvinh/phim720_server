class AddCrawlLinkToFilm < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :crawl_link, :string
  end
end
