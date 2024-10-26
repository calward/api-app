class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :message, null: false
      t.references :user, index: true
      t.references :post, index: true
      t.datetime :commented_at
      t.timestamps
    end
  end
end
