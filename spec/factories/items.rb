FactoryBot.define do
  factory :item do
    name {'テスト商品'}
    text {'テストテキスト'}
    category_id {2}
    condition_id {2}
    deli_fee_id {2}
    area_id {2}
    day_id {2}
    price {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end