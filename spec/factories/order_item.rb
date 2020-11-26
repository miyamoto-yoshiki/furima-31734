FactoryBot.define do
  factory :order_item do
    token {"tok_abcdefghijk00000000000000000"}
    post_num {"111-1111"}
    prefecture_id {3}
    city {"福岡市中央区荒戸"}
    details {"1-1-1"}
    build_num {"B棟"}
    phone_num {"08099992222"}
  end
end
