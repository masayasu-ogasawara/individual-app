## アプリ名
individual-app

## 概要
自分のプレイしたゲームの感想を投稿することができます。<br>
他の方の投稿を参考にしたり、コメントで気になった点を聞くこともできます。<br>
※投稿とコメントは新規会員登録/ログインをする必要があります。

## IPアドレス
<a href="http://54.199.44.57/">54.199.44.57</a>

## 登録済みユーザー
名前:投稿用アカウント<br>
アドレス:a@a<br>
パスワード:aaaaaaa

名前:閲覧用アカウント<br>
アドレスb@b<br>
パスワード:bbbbbbb

## 本番環境
AWS(EC2)

## サーバー
Unicorn / Nginx

## 開発環境
Ruby on Rails / Ruby / JavaScript / Haml / Sass / GitHub / Mysql

## DEMO
まずは必須事項を入力した上で、新規会員登録をお願いします。
<a href="https://gyazo.com/a73316e24bdfd726253d2e6875809ab3"><img src="https://i.gyazo.com/a73316e24bdfd726253d2e6875809ab3.gif" alt="Image from Gyazo" width="1000"/></a>


登録後は、自動的にログイン状態になりますので、投稿/コメントが可能になります。

投稿手順(必須事項を入力した上で投稿してください)
<a href="https://gyazo.com/56d919f77a1d35bba20e1f7e4085378e"><img src="https://i.gyazo.com/56d919f77a1d35bba20e1f7e4085378e.gif" alt="Image from Gyazo" width="1000"/></a>

コメント手順
<a href="https://gyazo.com/e339a89830b23f8dedbde014161f7463"><img src="https://i.gyazo.com/e339a89830b23f8dedbde014161f7463.gif" alt="Image from Gyazo" width="1000"/></a>

## 制作背景
今まで学んできた、ユーザー管理機能や投稿機能などの知識をアウトプットするために制作しました。<br>
内容について、自分はゲームが趣味なので、ゲームの口コミサイトにしました。

## 工夫したポイント
①ビュー、モデル、コントローラーが多くなると管理が煩雑になってしまうため、予め全体の流れを設計書として
起こしてから制作しました。<br>
②投稿一覧の部分に`gem 'kaminari'`を使用しページネーションを実装しました。

## 今後実装したい機能
キーワード検索機能、いいね機能、コメント編集・削除機能、購入機能

## 今後の課題
JavaScriptの知識が定着していないので、JavaScriptを活用した実装を絡めていくこと

## DB設計
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
