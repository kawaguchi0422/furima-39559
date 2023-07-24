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
- has_many :comments
- has_one :purchases

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
- has_many :items
- has_one :purchases
- belongs_to :user

## commentsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| text | text | null: false |
| user(FK) | references | null: false, foreign_key: true |
| items(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items

## purchaseテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |
| items(FK) | references | null: false, foreign_key: true |

### Association
- has_one :delivery_address
- belongs_to :user
- belongs_to :items

## delivery_addressテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| postal_code | text | null: false |
| prefecture | text | null: false |
| city | text | null: false |
| block | text | null: false |
| building_name | text | null: true |
| phone_number | text | null: false |
| purchase(FK) | integer | null: false, foreign_key: true |

### Association
- belongs_to :purchases