# テーブル設計

## users  テーブル
| Column     | Type   | options    |
| ---------- | ------ | ---------- |
| email      | string | null: false|
| password   | string | null: false|
| name       | string | null: false|
| profile    | text   | null: false|
| occupation | text   | null: false|
| position   | text   | null: false|

### Association

- has_many :comments
- has_many :prototypes


## prototypes テーブル
| Column    | Type      | Options      |
| --------- | --------- | -------------|
| title     | string    | null: false  |
| catch_copy| string    | null: false  |
| concept   | text      | null: false  |
| user      | references|              |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| prototype  | references |             |

### Association

- belongs_to :user
- belongs_to :prototype