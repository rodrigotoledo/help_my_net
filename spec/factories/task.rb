# frozen_string_literal: true

FactoryBot.define do
  factory(:task) do
    category_id { create(:category).id }
    description { Faker::Lorem.paragraph }
    title { Faker::Movie.title }
  end
end
