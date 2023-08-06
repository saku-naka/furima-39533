# README

## usersテーブル

|       Column       |  Type  |          Options          |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| birthday           | string | null: false               |

### Association
- belongs_to :items
- belongs_to :purchase
- belong_to :send


## itemsテーブル

|    Column    |  Type  |   Options   |
| ------------ | ------ | ----------- |
| item_image   | text   | null: false |
| product_name | string | null: false |
| description  | string | null: false |
| detail       | string | null: false |
| price        | string | null: false |

### Association
- has_many :user
- has_many :purchase
- has_many :send


## purchaseテーブル

|     Column      |  Type  |            Options             |
| --------------- | ------ | ------------------------------ |
| item_image      | text   | null: false, foreign_key: true |
| product_name    | string | null: false, foreign_key: true |
| price           | string | null: false, foreign_key: true |
| delivery_charge | string | null: false                    |
| total_price     | string | null: false                    |

### Association
- has_many :user
- belongs_to :items
- belongs_to :send


## sendテーブル

|     Column      |  Type  |   Options   |
| --------------- | ------ | ----------- |
| post_code      | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |
| phone_num      | integer | null: false |

### Association
- has_many :user
- belongs_to :items
- has_one :purchase