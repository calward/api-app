class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :github_username
      t.datetime :registered_at
      t.timestamps
    end
  end
end
