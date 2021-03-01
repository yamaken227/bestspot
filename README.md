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
| prefecture_id | string     | null: false                    |
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
