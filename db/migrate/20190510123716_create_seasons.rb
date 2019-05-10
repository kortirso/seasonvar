class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :movie_id
      t.integer :number
      t.timestamps
    end
    add_index :seasons, :movie_id
  end
end
