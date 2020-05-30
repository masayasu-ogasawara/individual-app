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

## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_date|date|null: false|

### Association
- has_many :games
- has_many :comments



## games table
|Column|Type|Options|
|------|----|-------|
|user|references| null: false, foreign_key: true;|
|name|string| null: false|
|introduction|text| null: false|

### Association
- belongs_to :user
- has_many :comments
- has_many :images



## images table
|Column|Type|Options|
|------|----|-------|
|game|references| null: false, foreign_key: true;|
|url|string|

### Association
- belongs_to :game



## comments table
|Column|Type|Options|
|------|----|-------|
|user|references| null: false, foreign_key: true;|
|game|references| null: false, foreign_key: true;|
|text|text| null: false|

### Association
- belongs_to :game
- belongs_to :user
