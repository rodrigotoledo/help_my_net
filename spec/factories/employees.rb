FactoryBot.define do
  factory :employee do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { 'aassdd' }
    password_confirmation { 'aassdd' }
    document { "00000000000" }
    address { Faker::Address.full_address }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
