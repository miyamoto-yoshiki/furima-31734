class ItemsController < ApplicationController
  def index
    #@items = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) #何を新しく保存するか指定
    @item.user_id = current_user.id #誰が投稿したかを指定     #キータから参照
    if @item.save #もし保存ができたら
      redirect_to root_path
    else #できなければ
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :deli_fee_id, :area_id, :day_id,:price, :image ).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def edit_access
    @item = Item.find(params[:id])
    unless  current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
