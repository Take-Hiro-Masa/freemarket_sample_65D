class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one :credit_card
  # has_one :image, dependent: :destroy
  # has_many :items, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_dd
  belongs_to_active_hash :birth_mm
  belongs_to_active_hash :birth_yyyy
  belongs_to_active_hash :prefecture
  has_many :cards

  
  
#   VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  
  
# #登録
#   validates :nickname, presence: true, length: { maximum: 20 }
#   validates :family_name, presence: true, length: { maximum: 35}
#   validates :first_name, presence: true, length:{ maximum: 35 }
#   validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
#   validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
#   validates :birth_yyyy_id, presence: true
#   validates :birth_mm_id, presence: true
#   validates :birth_dd_id, presence: true
  
#   VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/
#   VALID_AUTHENTICATION_NUMBER_REGEX = /\A\d{3}\z/
  
# #SMS認証
#   validates :phone_tel, presence: true, uniqueness: true, format: {with: VALID_PHONE_NUMBER_REGEX, message: "電話番号の入力が正しくありません"}
#   validates :authentication_number, presence: true, format: {with: VALID_AUTHENTICATION_NUMBER_REGEX, message: "認証番号が正しくありません"}
  
#   VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  
# #住所登録
#   validates :family_name, presence: true, length: { maximum: 35 }
#   validates :first_name, presence: true, length:{ maximum: 35 }
#   validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
#   validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
#   validates :postal_code, presence: true, length: { maximum: 35 }
#   validates :prefecture_id, presence: true, length: { maximum: 35 }
#   validates :city, presence: true, format: {with: VALID_POSTAL_CODE_REGEX, message: "郵便番号が正しくありません"}
#   validates :block, presence: true

  
  #   VALID_CREDIT_CARD_REGEX = /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/
# #クレジットカード登録
  #   validates :credit_card_id ,presence: true, uniqueness: true, format: {with: VALID_CREDIT_CARD_REGEX, "クレジットカード番号の入力が正しくありません"}

        
end
