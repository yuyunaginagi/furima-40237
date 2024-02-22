<!-- usersテーブル -->
| Column              | Type    | Options     |
|---------------------|---------|-------------|
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| first_name_kanji    | string  | null: false |
| last_name_kanji     | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| birth_day           | date    | null: false |

- has_many :items
- has_many :orders

<!-- itemsテーブル -->
| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| items_name         | string     | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| number_of_day_id   | integer    | null: false |
| price              | integer    | null: false |

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

<!-- deliverysテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| order            | references | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

- belongs_to :order