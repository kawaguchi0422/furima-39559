FactoryBot.define do
  factory : order_address do
    postal_code {'123-4567'}
    prefecture_id {1}
    city {'札幌市'}
    block {1-1}
    building_name {'札幌ハイツ'}
    phone_number {'09012345678'}
  end
end