class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions   #ActiveHashを用いてのbelongs_toが設定できる
  belongs_to :genre

  #空の投稿を保存できないようにする
  validates :name, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, numericality: { other_than: 1 }  #genre_idのid:1以外のときに保存できるという意味
end
