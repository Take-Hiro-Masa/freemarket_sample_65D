class PurchaseController < ApplicationController
before_action :set_item, only: [:pay, :show, :done]
before_action :set_address, only: [:show, :done]
before_action :full_name, only: [:show, :done]

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  #購入確認
  def show
    card = Card.find_by(user_id: current_user.id)
    if not user_signed_in?
      redirect_to new_user_session_path
    elsif card.blank?
      redirect_to controller: 'cards', action: 'new'
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp::Charge.create(
    amount: @item.price, #支払金額
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    @item.update(status_id: 4)
    redirect_to action: 'done' #完了画面に移動
  end

  #購入完了
  def done
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  

  
  
  private
  # # ユーザー情報
  # def set_user
  #   @user = User.find(@item.user_id)
  # end

  # 商品情報
  def set_item
    @item = Item.find(params[:id])
  end

  # ログインユーザーの住所
  def set_address
    @address = Prefecture.find(current_user.prefecture_id).name + current_user.city + current_user.block + current_user.building
  end

  # ログインユーザーのフルネーム
  def full_name
    @full_name = current_user.family_name + current_user.first_name
  end
end
