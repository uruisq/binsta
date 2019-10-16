class AddIndex2Favorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:user_id, :feed_id], unique: true
  end
end
