# README

## users テーブル

| Column                       | Type    | Options                   |
| ---------------------------- |---------| --------------------------|
| name                         | string  | null: false               |
| email                        | string  | null: false, unique: true |
| encrypted_password           | string  | null: false               |
| last_name_chinese_character  | string  | null: false               |
| first_name_chinese_character | string  | null: false               |
| last_name_kana               | string  | null: false               |
| first_name_kana              | string  | null: false               |
| birth                        | date    | null: false               |

### Associations

- has_many :items
- has_many :buys

## items テーブル

| Column                     | Type           | Options            |
| -------------------------- | -------------- | ------------------ |
| name                       | string         | null: false        |
| explanation_category_id    | integer        | null: false        |
| explanation_condition_id   | integer        | null: false        |
| delivery_fee               | string         | null: false        |
| shipment_source_address_id | integer        | null: false        |
| shipment_days              | string         | null: false        |
| seller                     | references     | foreign_key: true  |

### Associations

- belongs_to :user
- has_one :buy

## buys テーブル

| Column             | Type           | Options                |
| ------------------ | -------------- | -----------------------|
| buyer              | references     | foreign_key: true      |
| expiration_mouth   | text           | null :false            |
| expiration_year    | text           | null :false            |

### Association

- belongs_to :user
- belongs_to :user
- has_one :shipping

## Shippings テーブル

| Column          | Type             | Options                 |
| --------------- | ---------------- | ----------------------- |
| postal_code     | string           | null :false             |
| prefectures     | string           | null :false             |
| municipality    | string           | null :false             | 
| address         | string           | null :false             |
| building        | string           | null :false             |
| phone           | string           | null :false             |

### Association
- belongs_to :shipping