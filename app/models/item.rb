class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions   # ActiveHashを用いてのbelongs_toが設定できる

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :deli_fee
  belongs_to :area
  belongs_to :day
  has_one_attached :image # itemテーブルにimageカラムを追加する必要なない
  has_one :order

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :category_id
    validates :condition_id
    validates :deli_fee_id
    validates :day_id
  end

  validates :price, numericality: { only_integer: true, less_than: 10_000_000, greater_than_or_equal_to: 300, only_interger: true }  # numericalitはデフォルトだと少数も許可しているので、integerで整数のみ
end
