class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :purchaseable_id
      t.string :purchaseable_type
      t.integer :user_id
      t.string :video_quality
      t.timestamps
    end
    add_index :purchases, [:purchaseable_id, :purchaseable_type]
    add_index :purchases, :user_id
  end
end
