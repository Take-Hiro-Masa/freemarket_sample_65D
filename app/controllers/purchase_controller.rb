class PurchaseController < ApplicationController
before_action :authenticate_user!
before_action :set_user, only: [:pay, :confirmation, :done]
before_action :set_card, only: [:pay, :confirmation, :done]
before_action :set_item, only: [:pay, :confirmation, :done]
before_action :full_name, only: [:confirmation, :done]

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  #購入確認
  def confirmation
    if not user_signed_in?
      redirect_to new_user_session_path
    elsif @card.blank?
      redirect_to controller: 'cards', action: 'new'
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp::Charge.create(
    amount: @item.price, #支払金額
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    @item.update(status_id: 4)
    redirect_to action: 'done' #完了画面に移動
  end

  #購入完了
  def done
    if @card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  

  
  
  private
  # 購入ユーザー情報
  def set_user
    @user = User.find(current_user.id)
  end

  # カード情報
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  # 商品情報
  def set_item
    @item = Item.find(params[:id])
  end

  # ログインユーザーのフルネーム
  def full_name
    @full_name = current_user.family_name + current_user.first_name
  end
end
