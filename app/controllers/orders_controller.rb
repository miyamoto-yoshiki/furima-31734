class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_item = OrderItem.new   #「OrderItem」に編集
  end

  def create
    
    @item = Item.find(params[:item_id])
    # @order = Order.new(orderitem_params)
    # Address.create(orderitem_params)    
    # if @order.valid?
    #   pay_item
    #   @order.save
    #   return redirect_to root_path
    # else
    #   render 'index'
    # end

    #カリキュラム参照
    @order_item = OrderItem.new(orderitem_params)
    #binding.pry  #orderitem_parms @order_item
    if @order_item.valid? #
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

  
  # def order_params
  #   params.permit(:price).merge(token: params[:token]).merge(user_id:current_user.id).merge(item_id:@item.id)
  # end

  # def address_params
  #   params.permit(:post_num, :prefecture_id, :city, :details, :build_num, :phone_num).merge(user_id:@item.user.id)
  # end
end