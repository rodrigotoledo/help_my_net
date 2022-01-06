FactoryBot.define do
  factory :employee do
    name { Faker::Name.name_with_middle }
    document { Faker::CPF.pretty }
    email { Faker::Internet.email }
    alternative_email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }
    mobile_number { Faker::PhoneNumber.phone_number_with_country_code }
    address { Faker::Address.full_address }
    user { create(:user) }
  end
end
