FactoryBot.define do
  factory :user do
    email { "faker@test.com" }
    password  { "aassdd" }
    password_confirmation  { "aassdd" }
    name  { "Admin Faker" }
    address  { "São Paulo - SP" }
  end

  factory :company do
    name { "some company" }
  end

  factory :employee do
    email { "faker@test.com" }
    password  { "aassdd" }
    password_confirmation  { "aassdd" }
    name  { "Admin Faker" }
    address  { "Belo Horizonte - MG" }
    document { Faker::CPF.numeric }
  end
end