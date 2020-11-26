class Order < ApplicationRecord
  # belongs_to :prefecture
  belongs_to :user
  belongs_to :item
  # belongs_to :address
end
