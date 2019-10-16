class AddIndexTofFavorites < ActiveRecord::Migration[5.2]
  def up
    change_column_null :favorites, :user_id, false, 0
    change_column_null :favorites, :feed_id, false, 0
  end

  def down
    change_column_null :favorites, :user_id, true, nil
    change_column_null :favorites, :feed_id, true, nil
  end
end
