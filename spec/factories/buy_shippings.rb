FactoryBot.define do
  factory :buy_shipping do
    postal_code { '123-4567' }
    shipment_source_address_id { 2 }
    municipality { '取手市' }
    address { '上町1-1-1' }
    building { 'マンション1012' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
