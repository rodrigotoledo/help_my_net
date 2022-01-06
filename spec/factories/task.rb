# frozen_string_literal: true

FactoryBot.define do
  factory(:task) do
    category_id { create(:category).id }
    user { create(:user) }
    description { Faker::Lorem.paragraph }
    title { Faker::Movie.title }
    address { Faker::Address.full_address }
  end
end
