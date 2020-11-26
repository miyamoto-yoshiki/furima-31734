class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_item, only: [:index, :create]
  before_action :self_order_limitation, only: [:index, :create]
  before_action :sold_item_limitation, only: [:index, :create]

  def index
    @order = Order.new
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(orderitem_params) 
    if @order_item.valid?
      pay_item
      @order_item.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price , #商品の値段orderitem_params[:price]
      card: orderitem_params[:token],   #カードトークン
      currency:'jpy'                #通貨の種類
    )
  end

   # 全てのストロングパラメーターを1つに統合
  def orderitem_params
    params.require(:order_item).permit(:post_num, :prefecture_id, :city, :details, :build_num, :phone_num, :price).merge(user_id:current_user.id, item_id: params[:item_id] , token: params[:token])
    #:authenticity_token,はform_withで送るときは必ずついてくるので、キーとして指定する必要はない
    #.require(:order_item)はindexのmodel: で指定しているので、記述が必要
  end

  private
  def get_item
    @item = Item.find(params[:item_id])
  end

  def self_order_limitation
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_item_limitation
    redirect_to root_path if @item.order.present?
  end
end