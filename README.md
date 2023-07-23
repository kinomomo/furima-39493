# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| date_of_birth | date | null: false |

### Association
- has_many :items

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| descritption | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## ordersテーブル
| Column | Type | Option |
|-|-|-|
| user(FK) | references | null: false, foreign_key: true |
| item(FK) | references | null: false, foreign_key: true |

### Association
- has_one :addresses

## addressesテーブル
| Column | Type | Option |
|-|-|-|
| pastal_code | integer | null: false |
| prefectures | string | null: false |
| city | string | null: false |
| block | integer | null: false |
| building_name | string | null: false |
| phone_number | integer | null: false |
| order(FK) |references | null: false, foreign_key: true |

### Association
- belongs_to :order