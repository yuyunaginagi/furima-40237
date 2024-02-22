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
| year                | integer | null: false |
| month               | integer | null: false |
| day                 | integer | null: false |

- has_many :items
- has_many :orders

<!-- itemsテーブル -->
| Column          | Type    | Options     |
|-----------------|---------|-------------|
| image           | string  | null: false |
| items_name      | string  | null: false |
| explanation     | text    | null: false |
| category        | string  | null: false |
| condition       | string  | null: false |
| delivery_charge | string  | null: false |
| area            | string  | null: false |
| number_of_days  | string  | null: false |
| price           | integer | null: false |

- has_one :order
- belongs_to :user

<!-- ordersテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

<!-- deliverysテーブル -->
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

- belongs_to :order