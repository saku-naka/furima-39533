FactoryBot.define do
  factory :item do
    association :user
    
    product_name     {Faker::Name.name}
    description      {Faker::Lorem.sentence}
    category_id      { 2 }
    condition_id     { 2 }
    postage_id       { 2 }
    prefecture_id    { 2 }
    shipping_date_id { 2 }
    price            {Faker::Number.between(from: 300, to: 9_999_999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
