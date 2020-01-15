class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:set_user, :edit, :update, :show, :destroy, :suspension]
  before_action :set_user, only: [:show, :destory]
 

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


  def edit
    @item.images.detach 
  end

  def update
    if @item.user_id == current_user.id && @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to items_path
  end

  def suspension
    @item.update(status_id: 3)
    redirect_to root_path
  end

private

  def item_params
    params.require(:item).permit(
      :name,
      :category_id,
      :brand_id,
      :condition_id,
      :shippingfee_id,
      :prefecture_id,
      :shippingday_id,
      :description,
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end

  # ユーザー情報
  def set_user
    @user = User.find(@item.user_id)
  end
  
  # 商品情報
  def set_item
    @item = Item.find(params[:id])
  end

end
