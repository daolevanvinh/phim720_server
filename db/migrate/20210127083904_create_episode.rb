class CreateEpisode < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :index
      t.bigint :views
      t.string :max_resolution
      t.bigint :season_id
      t.string :type

      t.timestamps
    end

    add_foreign_key :episodes, :seasons
  end
end
