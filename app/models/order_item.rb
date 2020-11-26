class OrderItem
  include ActiveModel::Model
  attr_accessor :price, :user_id, :item_id, :post_num, :prefecture_id, :city, :details, :build_num, :phone_num ,:token

  with_options presence: true do
    validates :post_num,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :details
    validates :phone_num,     format: { with: /\A[0-9]+\z/ } , length: { maximum: 11}
    validates :token
  end

  def save
    item = Item.find(item_id)  #:必要ない

    Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, details: details, build_num: build_num, phone_num: phone_num, user_id: item.user.id) 

    Order.create(price: item.price, user_id: user_id, item_id: item.id) #user_id: user_idでcurrent取れる
  end
end