class AddIndexToMovieTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :movies, :title
  end
end
