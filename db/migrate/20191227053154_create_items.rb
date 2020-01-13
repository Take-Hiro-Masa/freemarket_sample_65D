class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.bigint :category_id, null: false, foreign_key: true, index: true
      t.bigint :brand_id, foreign_key: true, index: true
      t.bigint :condition_id, null: false, foreign_key: true, index: true
      t.bigint :shippingfee_id, null: false, foreign_key: true, index: true
      t.bigint :prefecture_id, null: false, foreign_key: true, index: true
      t.bigint :shippingday_id, null: false, foreign_key: true, index: true
      t.integer :status_id
      t.timestamps
    end
  end
end
