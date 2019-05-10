class AddCounterCacheToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :seasons_count, :integer, default: 0, null: false
  end
end
