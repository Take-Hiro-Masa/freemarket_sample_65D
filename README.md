
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_yyyy_id|bigint|null: false, foreign_key: true, index: true|
|birth_mm_id|bigint|null: false, foreign_key: true, index: true|
|birth_dd_id|integer|null: false, foreign_key: true, index: true|
|phone_tel|integer|null:  false, unique: true|
|postal_code|integer|null: false|
|prefecture_id|string|null: false, foreign_key: true, index: true|
|city|string|null: false|
|block|string|null: false|
|building|string||
|building_tel|integer||
|profile|text||

### アソシエーション

- belongs_to_active_hash :birth_dd
- belongs_to_active_hash :birth_mm
- belongs_to_active_hash :birth_yyyy
- belongs_to_active_hash :prefecture
- has_many :cards
- has_many :items, dependent: :destroy

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true, index: true|
|costomer_id|string|null: false|
|card_id|string|null: false|

### アソシエーション

- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|name|string|null: false|
|description|text|null: false|
|category_id|bigint|null: false, foreign_key: true, index: true|
|brand_id|bigint|null: false, foreign_key: true, index: true|
|condition_id|bigint|null: false, foreign_key: true, index: true|
|shippingfee_id|bigint|null: false, foreign_key: true, index: true|
|prefecture_id|bigint|null: false, foreign_key: true, index: true|
|shippingday_id|bigint|null: false, foreign_key: true, index: true|
|price|integer|null: false|
|status_id|integer|default: "0"|

### アソシエーション
  - belongs_to :user
  - has_many_attached :images, dependent: :destroy
  - belongs_to_active_hash :category
  - belongs_to_active_hash :brand
  - belongs_to_active_hash :condition
  - belongs_to_active_hash :shippingday
  - belongs_to_active_hash :prefecture
  - belongs_to_active_hash :shippingfee

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### アソシエーション

  - has_many :items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### アソシエーション

  - has_many :items

## conditionテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### アソシエーション
　
  - has_many :items

## shippingfeeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### アソシエーション
　
  - has_many :items

## prefectureテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### アソシエーション
　
  - has_many :users
  - has_many :items

## shippingdayテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### アソシエーション
　
  - has_many :items