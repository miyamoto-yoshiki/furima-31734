class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions   #ActiveHashを用いてのbelongs_toが設定できる
  
  belongs_to :category
  belongs_to :condition
  belongs_to :deli_fee
  belongs_to :area
  belongs_to :day
  has_one_attached :image #messageテーブルにカラムを追加する必要なない

  #空の投稿を保存できないようにする
  validates :name, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :area_id, numericality: { other_than: 1 }  #genre_idのid:1以外のときに保存できるという意味
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
end
