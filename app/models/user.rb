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



  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
 

  with_options on: :name do |name|
    name.validates :family_name, presence: true, length: { maximum: 35}
    name.validates :first_name, presence: true, length:{ maximum: 35 }
    name.validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
    name.validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
  end

  
  with_options on: :step3 do |step3|
    step3.validates :nickname, presence: true, length: { maximum: 20 }
    step3.validates :birth_yyyy_id, presence: true
    step3.validates :birth_mm_id, presence: true
    step3.validates :birth_dd_id, presence: true
  end

  #電話番号認証
  validates :phone_tel, presence: true, uniqueness: true, format: {with: VALID_PHONE_NUMBER_REGEX, message: "電話番号の入力が正しくありません"}, on: :step4

  #住所登録
  with_options on: :address do |address|
    address.validates :postal_code, presence: true, length: { maximum: 35 }
    address.validates :prefecture_id, presence: true, length: { maximum: 35 }
    address.validates :city, presence: true, format: {with: VALID_POSTAL_CODE_REGEX, message: "郵便番号が正しくありません"}
    address.validates :block, presence: true
  end
end