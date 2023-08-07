# README

## usersテーブル

|       Column       |  Type  |          Options          |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| read_first         | string | null: false               |
| read_last          | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :item_purchases


## itemsテーブル

|      Column      |    Type    |            Options             |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date


## ordersテーブル

|       Column     |    Type    |            Options             |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses


## shipping_addressesテーブル

|     Column     |    Type    |             Options            |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
- has_one :orders
- belongs_to_active_hash :prefectures