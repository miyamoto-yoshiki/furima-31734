# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_kana          | string | null: false |
| first_kana         | string | null: false |
| birthday           | date   | null: false | #date型は年、月、日を1つで指定して取得できる


### Association
- has_many :items
- has_many :orders
- has_many :addresses #現住所や実家などの選択肢があるため

## items テーブル

| Column      | Type      | Options           |
| ----------- | --------- | ----------------- |
| item_name   | string    | null: false       |
| seller      | string    | null: false       |
| text        | text      | null: false       |
| category_id | integer   | null: false       |
| condition_id| integer   | null: false       |
| deli_fee_id | integer   | null: false       |
| area_id     | integer   | null: false       |
| days_id     | integer   | null: false       |
| price       | integer   | null: false       |
| user        | references| null: false       | #READMEへの外部キー制約の記述はこれで合っていますか？

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type      | Options           |
| --------- | --------- | ----------------- |
| buyer_id  | integer   | null: false       |
| item_id   | integer   | null: false       |
| user      | references| null: false       |
| item      | references| null: false       |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column    | Type      | Options     |
| --------- | --------- | ----------- |
| post_num  | string    | null: false | # xxx-yyyy -が入るためstring?
| prefecture| string    | null: false | #県
| city      | string    | null: false | #市
| details   | string    | null: false | #町名番地等
| build_num | integer   | null: false |
| phon_num  | integer   | null: false | 
| user      | references| null: false |
### Association
- belongs_to :user
- belongs_to :order