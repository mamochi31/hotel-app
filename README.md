# アプリケーション名

- ホテル予約管理システム

# 概要

ホテルの予約管理システムです。
予約の登録・編集・削除・検索機能と、予約登録の際に使用する各種コードの作成・編集・削除・検索機能を実装しています。
あくまで自身のスキルアップを目的として作成しているため、システムとして不十分なものとなっています。

# テスト用アカウント

- Email：test@com
- Pass ：aaa111

# 利用方法

- ログイン後トップページが表示されます。
- ページ上部のメニューバーから各種ページを開くことができます。
（マルチウィンドウを採用しており、トップページ上に他ページをいくつも開けます。）


# 目指した課題解決

- 大量のデータを保存することが考えられるため、データ保存形式を効率化
- ホテル内で多数の人が同じシステムを使用して予約を作成するため、入力内容が人によってバラバラにならないように設計
（性別や地域などの不変の要素を特定コードで入力する形式）
- 作業効率の観点から、複数のブラウザを行き来するのではなく、１つのページで多数のウィンドウを表示することで、１画面で作業ができるように設計

# 機能

- 予約登録は必須項目を入力すると登録できます。（黄色の入力欄が必須項目です。）
- 予約登録の際、「性別」「ランク」「部屋タイプ」「プラン」「リクエスト」「地域」の入力欄は特定のコードで入力します。
（@を入力することで入力可能なコードが一覧表示されます。またコードは部分一致の予測検索が随時表示されます。）
- 各種コードはメニューバーの作成から、検索・作成・編集・削除が可能です。
- 予約検索では、名前検索・到着日検索・プラン検索・部屋タイプ検索が行えます。（全て空欄で全件検索ができます。）
- 検索結果に表示された対象をダブルクリックで、その対象の詳細画面が表示されます。
- 予約詳細画面で、予約の編集・削除が行えます。（詳細画面の戻るボタンは１つ前のページに戻る機能です。）

# 実装予定の機能

### ルームアサイン機能

- 同じ日に同じ部屋番号は使用できないように設計する（必須要件）
- 部屋にタグを部屋タイプとタグを紐づけることで、予約内容と一致する部屋から自動でアサインする機能を実装（チャレンジ要件）

### 集計機能とスプレッドシートへの出力

- 日付や性別、プラン、地域など様々な条件で集計する機能を実装（必須要件）
- 集計結果をスプレッドシートへ表形式で出力する機能を実装（チャレンジ要件）

# テーブル設計
<!-- ※コメントアウト部分は実装予定で現在未実装のものです。 -->

## Usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :gests

## Gestsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name1_kana        | string     | null: false                    |
| name2_kana        | string     |                                |
| name3_kana        | string     |                                |
| memo              | string     |                                |
| company_kana      | string     |                                |
| company_kanji     | string     |                                |
| phone_number      | string     | null: false                    |
| remark            | string     |                                |
| sex_id            | string     |                                |
| rank_id           | string     |                                |
| room_type_id      | string     | null: false                    |
| plan_id           | string     | null: false                    |
| area_id           | string     | null: false                    |
| arr_date          | date       | null: false                    |
| dep_date          | date       | null: false                    |
| night             | integer    | null: false                    |
| adult             | integer    | null: false                    |
| child             | integer    |                                |
| baby              | integer    |                                |
| number_of_room    | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
<!-- | room              | references | foreign_key: true,             | -->

### Association

- belongs_to :user
- belongs_to :room_type
- belongs_to :plan
- belongs_to :sex,  optional: true
- belongs_to :rank, optional: true
- belongs_to :area, optional: true
<!-- - belongs_to :room, optional: true -->

- has_many :gest_tags
- has_many :tags, through: :gest_tags
<!-- - has_many :gests_rooms
- has_many :rooms, through :gests_rooms -->

## Ranksテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| code   | string     | null: false |
| name   | string     | null: false |

### Association

- has_many :gests

<!-- ## Roomsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| number    | string     | null: false                    |
| room_type | references | null: false, foreign_key: true | -->

<!-- ### Association

- belongs_to :room_type

- has_many :gests_rooms
- has_many :gests, through :gests_rooms

- has_many :rooms_tags
- has_many :tags, through :rooms_tags -->

## Room_typesテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| code     | string  | null: false |
| name     | string  | null: false |
| capacity | integer | null: false |

### Association

- has_many :gests
<!-- - has_many :rooms -->

<!-- - has_many :room_types_tags
- has_many :tags, through :room_types_tags -->

## Tagsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| code   | string | null: false |
| name   | string | null: false |

### Association

- has_many :gest_tags
- has_many :gests, through :gest_tags

<!-- - has_many :room_types_tags
- has_many :rooms, through :room_types_tags -->

<!-- - has_many :rooms_tags
- has_many :rooms, through :rooms_tags -->

## Plansテーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| code   | string  | null: false |
| name   | string  | null: false |
| price  | integer | null: false |

### Association

- has_many :gests

<!-- ## Gest_roomsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| gest   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :gest
- belongs_to :room -->

<!-- ## Room_tagsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| room   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tag -->

<!-- ## Room_type_tagsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| room_type | references | null: false, foreign_key: true |
| tag       | references | null: false, foreign_key: true |

### Association

- belongs_to :room_type
- belongs_to :tag -->

## Gest_tagsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| gest   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :gest
- belongs_to :tag

## Sexesテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| code   | string     | null: false |
| name   | string     | null: false |

### Association

- has_many :gests

## Areasテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| code   | string     | null: false |
| name   | string     | null: false |

### Association

- has_many :gests

## ER図

![hotel_app_table](https://user-images.githubusercontent.com/74651870/104150436-26ff9180-541d-11eb-86fa-a3e7b243ef1b.png)

# ローカルでの動作方法

### 手順
- git cline後、以下のコマンドを実行してください

```
% bundle install
% yarn install
% rails db:create
% rails db:migrate
```

### 動作環境

- Rails 6.0.3.4
- ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin19]
