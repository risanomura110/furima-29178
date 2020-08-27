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
| year        | integer | null: false |
| month       | integer | null: false |
| day         | integer | null: false |


### Association

- has_one :seller
- has_many :comments
- has_many :items, through: seller
- belongs_to_active_hash :year
- belongs_to_active_hash :month
- belongs_to_active_hash :day



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
| seller    | reference | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :seller
- belongs_to :provision
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

## provisions（配送先の情報） テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| postal     | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | integer    | null: false                    |
| building   | string     |                                |
| phone      | integer    | null: false                    |
| item       | references | null: false                    |
| buyer      | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to_active_hash :prefecture

## sellersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false                    |
| user   | references | null: false,foreign_key: true  |
### Association

- has_many :items
- belongs_to :user

<!-- - has_many :rooms, through: room_users -->
