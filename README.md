# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | --------------------|
| email              | string | NOT NULL,ユニーク制約 |
| encrypted_password | string | NOT NULL            |
| name               | string | NOT NULL            |
| profile            | text   | NOT NULL            |
| occupation         | text   | NOT NULL            |
| position           | text   | NOT NULL            |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## prototypes テーブル


| Column             | Type      | Options             |
| ------------------ | ------    | --------------------|
| title              | string    | NOT NULL            |
| catch_copy         | text      | NOT NULL            |
| concept            | text      | NOT NULL            |
| user               | reference | NOT NULL,外部キ-     |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## comments テーブル

| Column             | Type      | Options             |
| ------------------ | --------- |---------------------|
| content            | text      | NOT NULL            |
| prototype          | reference | NOT NULL,外部キ-     |
| user               | reference | NOT NULL,外部キ-     |

### Association

- belongs_to :room
- belongs_to :user