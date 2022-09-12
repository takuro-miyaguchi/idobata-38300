# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| prefecture_id      | integer | null: false               |
| municipality       | string  | null: false               |
| address            | string  | null: false               |
| latitude           | float   | null: false               |
| longitude          | float   | null: false               |

### Association

- has_many :informations
- has_many :friends
- has_many :favorites
- has_many :group_users

## informations テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| category_id | integer    | null: false                    |
| image       | string     | null: false                    |
| subtitle    | string     | null: false                    |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| status      | string     | null: false                    |

### Association

- belongs_to :user
- has_many :favorites
- has_many :group_informations

## favorites テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| information | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :information

## friends テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| follower_id | integer | null: false |
| followee_id | integer | null: false |
| status      | string  | null: false |

### Association

- belongs_to :user

## groups テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :group_informations
- has_many :group_users

## group_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| group  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :group_user

## group_informations テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| group       | references | null: false, foreign_key: true |
| information | references | null: false, foreign_key: true |

### Association

- belongs_to :information
- belongs_to :group
