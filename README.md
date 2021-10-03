# DB 設計

## users table

| Column             | type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

## Association

* has_many :items
* has_many :orders

## items table

| Column           | type       | Options                        |
|------------------|------------|--------------------------------|
| title            | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| lead_time_id     | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

## Association

* belongs_to :user
* has_one :order
* has_one_attached :image

## orders table

| Column | type       | Options                        |
|--------|------------|--------------------------------|
|user    | references | null: false, foreign_key: true |
|item    | references | null: false, foreign_key: true |

## Association

* belongs_to :user
* belongs_to :item
* has_one :shipping_information

## shipping_informations table

| Column           | type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

## Association

* belongs_to :order
