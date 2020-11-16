# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| full_name| string | null: false |
| full_kana| string | null: false |
| birthday | integer| null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| name     | string   | null: false |
| seller   | string   | null: false |
| text     | text     | null: false |
| category | string   | null: false |
| condition| string   | null: false |
| deli_fee | integer  | null: false |
| area     | string   | null: false |
| days     | string   | null: false | "1~2日で発送"→1~2?
| price    | integer  | null: false |

### Association

- belongs_to :user
- belongs_to :orders

## orders テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| buyer_id  | integer | null: false |
| seller_id | integer | null: false |
| item_id   | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items
