# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| email      | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- belongs_to:buyer
## items テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| nickname         | string    | null: false |
| category         | string    | null: false |
| product_status   | string    | null: false |
| postage          | string    | null: false |
| ship_from        | string    | null: false |
| date_of_shipment | date time | null: false |
| item_name        | string    | null: false |

### Association
- belong_to :items
- belong_to :buyer

##  buyerテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |


### Association

- has_many :items
- belongs_to :users

## living place テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| items_id      | references | null: false, foreign_key: true |
| postcode      | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     | null: false                    |
| phone_number  | integer    | null: false                    |
|               |            |                                |


### Association
belongs_to buyer