# テーブル設計

## Usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :gests

## Gestsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name1_kana        | string     | null: false                    |
| name1_kanji       | string     |                                |
| name2_kana        | string     |                                |
| name2_kanji       | string     |                                |
| name3_kana        | string     |                                |
| name3_kanji       | string     |                                |
| memo              | string     |                                |
| company_kana      | string     |                                |
| company_kanji     | string     |                                |
| phone_number      | string     | null: false                    |
| remark            | string     |                                |
| arr_date          | date       | null: false                    |
| dep_date          | date       | null: false                    |
| night             | integer    | null: false                    |
| adult             | integer    | null: false                    |
| child             | integer    |                                |
| baby              | integer    |                                |
| number_of_room    | integer    | null: false                    |
| sex_id            | integer    |                                |
| rank              | references | foreign_key: true              |
| room_type         | references | null: false, foreign_key: true |
| room              | references | foreign_key: true              |
| plan              | references | null: false, foreign_key: true |
| area              | references | foreign_key: true              |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room_type
- belongs_to :plan
- belongs_to :sex,  optional: true
- belongs_to :rank, optional: true
- belongs_to :room, optional: true
- belongs_to :area, optional: true

- has_many :gests_rooms
- has_many :rooms, through :gests_rooms
- has_many :gests_tags
- has_many :tags, through: :gests_tags

## Ranksテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| cd      | string     | null: false |
| content | string     | null: false |

### Association

- has_many :gest

## Roomsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| number    | string     | null: false                    |
| room_type | references | null: false, foreign_key: true |

### Association

- belongs_to :room_type

- has_many :gests_rooms
- has_many :gests, through :gests_rooms

- has_many :rooms_tags
- has_many :tags, through :rooms_tags

## Room_typesテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| cd       | string  | null: false |
| name     | string  | null: false |
| capacity | integer | null: false |

### Association

- has_many :gests
- has_many :rooms

- has_many :room_types_tags
- has_many :tags, through :room_types_tags

## Tagsテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| cd        | string | null: false |
| content   | string | null: false |

### Association

- has_many :gests_tags
- has_many :gests, through :gests_tags

- has_many :room_types_tags
- has_many :rooms, through :room_types_tags

- has_many :rooms_tags
- has_many :rooms, through :rooms_tags

## Plansテーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| cd      | string | null: false |
| content | string | null: false |
| price   | string | null: false |

### Association

- has_many :gest

## Gests_roomsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| gest   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :gest
- belongs_to :room

## Rooms_tagsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| room   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tag

## Room_types_tagsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| room_type | references | null: false, foreign_key: true |
| tag       | references | null: false, foreign_key: true |

### Association

- belongs_to :room_type
- belongs_to :tag

## Gests_tagsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| gest   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :gest
- belongs_to :tag

## Active Hash

- sex
- area
