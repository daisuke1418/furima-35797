FactoryBot.define do
  factory :order_destination do
    postal_code       { '111-1111' }
    prefecture_id     { 2 }
    municipalities    { '横浜市緑区' }
    house_number      { '青山1-1-1' }
    building_name     { '柳ビル103' }
    telephone_number  { 12345678910 }
  end
end
