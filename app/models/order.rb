class Order < ApplicationRecord
  validates :price, presence: true
  has_one :item
  belongs_to :prefecture
  attr_accessor :token
end
