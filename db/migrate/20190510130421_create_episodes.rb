class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.integer :season_id
      t.integer :number
      t.timestamps
    end
    add_index :episodes, :season_id
  end
end
