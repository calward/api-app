class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.string :message, null: false
      t.references :user, index: true
      t.references :rater, index: true, foreign_key: { to_table: :users }
      t.integer :rating, null: false
      t.datetime :rated_at, null: false
      t.timestamps
    end
  end
end
