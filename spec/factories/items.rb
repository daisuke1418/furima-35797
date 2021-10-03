FactoryBot.define do
  factory :item do
    title         {Faker::Lorem.sentence}
    explanation   {Faker::Lorem.sentence}
    category_id   { 2 }
    condition_id  { 2 }
    postage_id    { 2 }
    prefecture_id { 2 }
    lead_time_id  { 2 }
    price         {Faker::Number.number(digits: 4)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
