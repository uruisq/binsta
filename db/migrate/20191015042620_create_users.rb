class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :icon
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
