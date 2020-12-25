FactoryBot.define do
  factory :item do
    name                          {"アイテム"}
    explanation_category_id       {"2"}
    explanation_condition_id      {"2"}
    delivery_fee_id               {"2"}
    shipment_source_address_id    {"2"}
    shipment_day_id               {"2"}
    explanation                   {"説明文"}
    price                         {"1000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima_test.png'), filename: 'furima_test.png')
    end
  end
end
