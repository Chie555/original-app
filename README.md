# アプリケーション名
original-app


# アプリケーション概要
体重体脂肪率といった身体の情報を管理できるアプリ


# URL
https://original-app-zih8.onrender.com


# テスト用アカウント
・Basic認証パスワード： 2023

・Basic認証ID： admin




# 利用方法
## ユーザー登録
1.トップページの「新規登録」をクリックしてユーザー登録を行う。

2.ニックネーム、アドレス、パスワード、体重は必須項目、性別、生年月日、居住地、身長は任意として設定できる。

## 体重・体脂肪投稿（ユーザー投稿後可能）
1.カレンダーの日付ボタンから体重、体脂肪率、今日の予定（カテゴリ）、今日の予定詳細、メモ、画像を入力できる。体重のみ必須であとは任意。その際、BMIが自動表示される。

2.投稿ボタンを押したら投稿完了。

## フォロー管理
1.トップページの検索機能から身長、年齢、体重を指定して条件に近いユーザーを検索してフォローできる。

2.フォローしたユーザーがトップページの一覧に表示される。

# テーブル設計
## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| nickname           | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| sex_id             | integer     |                           |
| birthday           | date        |                           |
| prefecture_id      | integer     |                           |
| weight             | float       | null: false               |
| height             | float       | null: false               |
| fat_percentage     | float       |                           |
| target_weight      | float       | null: false               |

### Association

- has_many :posts
- has_many :follows
- has_many :comments

## posts テーブル

| Column         | Type              | Options                        |
| -------------- | ----------------- | ------------------------------ |
| weight         | integer           | null: false                    |
| fat_percentage | integer           |                                |
| today1_id      | integer           |                                |
| today1_memo    | string            |                                |
| today2_id      | integer           |                                |
| today2_memo    | string            |                                |
| today3_id      | integer           |                                |
| today3_memo    | string            |                                |
| memo           | text              |                                |
| user           | references        | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## follows テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| follower_id | references | null: false, foreign_key: true |
| followee_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

# ER図
[![Image from Gyazo](https://i.gyazo.com/25e6a28270df497bb6cc3f957e3f76d4.png)](https://gyazo.com/25e6a28270df497bb6cc3f957e3f76d4)