class OrderItem
  include ActiveModel::Model
  attr_accessor :price, :user_id, :item_id, :post_num, :prefecture_id, :city, :details, :build_num, :phone_num ,:token #ここで受け取る

  #order.rbのバリデーション

  #address.rbのバリデーション
  with_options presence: true do
    validates :post_num,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :details
    validates :phone_num,     format: { with: /\A[0-9]{11}+\z/, message: '' }
  end

  def save
    # アイテムの情報を保存し、「item」という変数に入れている
    item = Item.find(item_id)  #:必要ない

    # 住所の情報を保存
    Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, details: details, build_num: build_num, phone_num: phone_num, user_id: item.user.id) 

    # 商品の情報を保存
    Order.create(price: item.price, user_id: user_id, item_id: item.id) #user_id: user_idでcurrent取れる
  
  end
end