## users テーブル

| Column   | Type    | Options     |
| -------- | ------  | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| kanji    | string  | null: false |
| kana     | string  | null: false |
| birthday | integer | null: false |

### Association

- belongs_to :seller
- belongs_to :buyer
- has_many :comments


## items 

| Column    | Type      | Options                        |
| ------    | ------    | ------------------------------ |
| image     | text      | null: false                    |
| item-name | string    | null: false                    |
| info      | text      | null: false                    |
| category  | string    | null: false                    |
| status    | string    | null: false                    |
| shipping  | string    | null: false                    |
| prefecture| string    | null: false                    |
| price     | integer   | null: false                    |
| seller    | reference | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :seller
- belongs_to :buyer
- belongs_to :provision


## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## cards (クレジットカード情報)テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| number     | integer    | null: false                    |
| expiration | integer    | null: false                    |
| cvc        | integer    | null: false                    |
| buyer      | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer

## provisions（配送先の情報） テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| postal     | integer    | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | integer    | null: false                    |
| building   | string     | null: false                    |
| phone      | integer    | null: false                    |
| item       | references | null: false                    |
| buyer      | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to :buyer

## sellersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false                    |
| user   | references | null: false,foreign_key: true  |
### Association

- has_many :items
- belongs_to :user

## buyersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false                    |
| user        | references | null: false,foreign_key: true  |
| provision   | references | null: false                    |
| card        | references | null: false                    |

### Association

- has_many :items
- belongs_to :user
- has_many :provisions
- has_many :cards

<!-- - has_many :rooms, through: room_users -->
