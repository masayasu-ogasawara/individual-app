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
|name|string|index: true, null: false, unique: true|
|email|string|null: false, |
|encrypted_password|string|null: false|
|nickname|string|null: false|
|profile|text|
|icon_img|int|
|heaer_img|int|

### Association
- has_many :tweets
- has_many :comments
- has_many :favorites


## tweets table

|Column|Type|Options|
|------|----|-------|
|user_id|integer| null: false, foreign_key: true;|
|name|string|
|text|text|
|image|text|

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites


## comments table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|tweet_id||integer|
|text|text|

### Association
- belongs_to :user
- belongs_to :tweet
- has_many :favorites

## favorites table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|tweet_id||integer|

### Association
- belongs_to :user
- belongs_to :tweet
- belongs_to :comment