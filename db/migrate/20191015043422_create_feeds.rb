class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.text :image

      t.timestamps
    end
  end
end
