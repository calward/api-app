class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :user, index: true
      t.datetime :posted_at
      t.timestamps
    end
  end
end
