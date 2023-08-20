FactoryBot.define do
  factory :order_address do
    user_id { 2 }
    item_id { 2 }
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '青森市' }
    address { '林檎町1-1-11' }
    building_name { '青森ハイツ' }
    phone_num { '08012345678' }
  end
end