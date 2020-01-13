class CardsController < ApplicationController

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  def new
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      ) 
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
        )
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "create"
      end
    end
  end



  # def delete 
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "new"
  # end


end
