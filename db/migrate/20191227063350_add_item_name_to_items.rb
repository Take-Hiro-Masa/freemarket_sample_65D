class AddItemNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_name, :string, null: false
    add_column :items, :description, :text,  null: false
    # add_column :items, :shipping_method, :string, null: false
    add_column :items, :price, :integer, null: false
  end
end
