class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :phone_tel, :string, null: false, unique: true
    add_column :users, :postal_code, :integer, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :block, :string, null: false
    add_column :users, :building, :string
    add_column :users, :building_tel, :integer
    add_column :users, :profile, :text
  end
end
