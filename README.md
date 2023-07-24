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
- has_one :purchase

## itemsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| image | text | null: false |
| descritption | text | null: false |
| price | integer | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_date_id | integer | null: false |
| prefecture_id | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |

### Association
- has_many :comments
- has_one :purchase
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
- belongs_to :item

## purchasesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| user(FK) | references | null: false, foreign_key: true |
| items(FK) | references | null: false, foreign_key: true |

### Association
- has_one :delivery_address
- belongs_to :user
- belongs_to :item

## delivery_addressesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| postal_code | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| block | string | null: false |
| building_name | string ||
| phone_number | string | null: false |
| purchase(FK) | integer | null: false, foreign_key: true |

### Association
- belongs_to :purchase