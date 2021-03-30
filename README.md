# bestspot
このサービスを旅行の際使うことで、各都道府県のあまり知られていない隠れスポットを知ることが出来ます。
また、投稿者は隠れスポットを共有することで、その地域の発展に貢献することができます。

## Description
本サービスのターゲットは旅行者です。
何回も訪れたことのある地域でも意外と知らない隠れスポットがあると思います。
本サービスはまだ見ぬ観光スポットに出会う支援を致します。

## Technology used
 - Ruby 2.6.5
 - Ruby on Rails 6.0.3.4
 - MySQL 5.6.50 
 - RSpec

# テーブル設計

## users テーブル

| Column          | Type    | Options                        |
| --------------- | --------| -------------------------------|
| email           | string  | null: false                    |
| password        | string  | null: false                    |
| last_name       | string  | null: false                    |
| first_name      | string  | null: false                    |
| nickname        | string  | null: false                    |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| prefecture_id | integer     | null: false                    |
| place_name    | string     | null: false                    |
| place_detail  | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_many    :comments

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post


