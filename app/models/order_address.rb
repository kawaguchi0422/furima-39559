class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
  end

  # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  validates :postal_code, presence: true,
                          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }

  # 0以外の整数を許可する
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, block:,
                   building_name:, phone_number:)
  end
end
