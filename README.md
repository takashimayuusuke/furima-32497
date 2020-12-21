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
| delivery_fee_id            | integer        | null: false        |
| shipment_source_address_id | integer        | null: false        |
| shipment_day_id            | integer        | null: false        |
| user                       | references     | foreign_key: true  |
| explanation                | text           | null: false        |
| price                      | integer         | null: false       |

### Associations

- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## Shippings テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null :false       |
| prefectures_id   | integer    | null :false       |
| municipality     | string     | null :false       |
| address          | string     | null :false       |
| building         | string     |                   |
| phone            | string     | null :false       |
| buy              | references | foreign_key: true |

### Association
- belongs_to :buy