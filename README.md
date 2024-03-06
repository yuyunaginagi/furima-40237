<!-- usersテーブル -->
| Column              | Type    | Options     |
|---------------------|---------|-------------|
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_kana     | string  | null: false |
| last_name_kana      | string  | null: false |
| birth_day           | date    | null: false |

- has_many :items
- has_many :orders

<!-- itemsテーブル -->
| Column                 | Type       | Options     |
|------------------------|------------|-------------|
| user                   | references | null: false, foreign_key: true        |
| name                   | string     | null: false |
| info                   | text       | null: false |
| category_id            | integer    | null: false |
| sales_status_id        | integer    | null: false |
| shipping_fee_status_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| scheduled_delivery_id  | integer    | null: false |
| price                  | integer    | null: false |

- has_one :order
- belongs_to :user

<!-- ordersテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :delivery

<!-- deliveriesテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| order            | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| addresses        | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |

- belongs_to :order