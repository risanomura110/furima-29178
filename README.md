## users テーブル

| Column      | Type    | Options     |
| ------------| ------  | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| family-kanji| string  | null: false |
| first-kanji | string  | null: false |
| family-kana | string  | null: false |
| first-kana  | string  | null: false |
| birthday    | date    | null: false |

### Association

- has_many :orders
- has_many :comments
- has_many :items

## items 

| Column    | Type      | Options                        |
| ------    | ------    | ------------------------------ |
| image     | text      | null: false                    |
| item-name | string    | null: false                    |
| info      | text      | null: false                    |
| category  | integer   | null: false                    |
| status    | integer   | null: false                    |
| shipping  | integer   | null: false                    |
| area      | integer   | null: false                    |
| schedule  | integer   | null: false                    |
| price     | integer   | null: false                    |
| user      | integer   | null: false, foreign_key: true |


### Association

- has_many :comments
- has_one :order
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping
- belongs_to_active_hash :area
- belongs_to_active_hash :schedule

## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## address（配送先の情報） テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| postal     | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| add        | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
| order      | references | null: false,foreign_key: true  |


### Association

- belongs_to :order
- belongs_to_active_hash :prefecture

## orders(購入履歴)テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false,foreign_key: true  |
| user        | references | null: false,foreign_key: true  |
### Association

- belongs_to :user
- belongs_to :item
- has_one : address

