class ItemsController < ApplicationController
  before_action :move_to_session, only: [:new, :create, :edit, :update]

  def index
    @allitems = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.valid?
      item.save
      redirect_to item_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :deli_fee_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
  # def move_to_root
  #   redirect_to root_path  商品購入機能実装後に実装 売却済み商品のURL入れるとログイン中のユーザー誰でもトップへ
  # end
end
