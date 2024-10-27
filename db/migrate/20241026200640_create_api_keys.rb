class CreateApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :api_keys do |t|
      t.string :value, null: false

      t.timestamps
    end
  end
end
