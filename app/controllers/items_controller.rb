class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.limit(10).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item_image = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'items/new'
    end
  end

  def show
  end


private

  def item_params
    params.require(:item).permit(
      :category_id,
      :brand_id,
      :condition_id,
      :shippingfee_id,
      :prefecture_id,
      :shippingday_id,
      :name,
      :description,
      :price,
      images: []
    )
  end
  
  # 商品情報
  def set_item
    @item = Item.find(params[:id])
  end
end
