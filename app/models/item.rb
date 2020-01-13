class Item < ApplicationRecord
  # belongs_to :user
  has_many_attached :images, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :brand
  belongs_to_active_hash :condition
  belongs_to_active_hash :shippingday
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shippingfee
end
