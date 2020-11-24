class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @order = Order.new(order_params)
    Address.create(address_params)
    if @order.valid?
      Payjp.api_key = "sk_test_256f80608a007317bb5b3a36"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.permit(:price).merge(token: params[:token])
  end

  def address_params
    params.permit(:post_num, :prefecture_id, :city, :details, :build_num).merge(user_id:current_user.id)
  end
end