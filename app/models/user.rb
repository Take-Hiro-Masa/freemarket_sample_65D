class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_dd
  belongs_to_active_hash :birth_mm
  belongs_to_active_hash :birth_yyyy
  belongs_to_active_hash :prefecture
  has_many :items, dependent: :destroy
  has_many :cards, dependent: :destroy

end
