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
| birthday_year      | data   | null: false               |
| birthday_moon      | data   | null: false               |
| birthday_day       | data   | null: false               |

## Association

* has_many :items
* has_many :orders

## items table

| Column        | type       | Options           |
|---------------|------------|-------------------|
| title         | string     | null: false       |
| explanation   | string     | null: false       |
| category      | string     | null: false       |
| condition     | string     | null: false       |
| postage       | string     | null: false       |
| shipping_area | string     | null: false       |
| lead_time     | string     | null: false       |
| price         | string     | null: false       |
| user          | references | foreign_key: true |

## Association

* belongs_to :user
* has_one :order

## orders table

| Column | type       | Options           |
|--------|------------|-------------------|
|user    | references | foreign_key: true |
|item    | references | foreign_key: true |

## Association

* belongs_to :user
* belongs_to :item
* has_one :shipping_information

## shipping_informations table

| Column           | type       | Options           |
|------------------|------------|-------------------|
| postal_code      | string     | null: false       |
| prefectures      | string     | null: false       |
| municipalities   | string     | null: false       |
| house_number     | string     | null: false       |
| building_name    | string     | null: false       |
| telephone_number | string     | null: false       |
| order            | references | foreign_key: true |

## Association

* belongs_to :order
