# frozen_string_literal: true

require 'cpf_faker'
FactoryBot.define do
  factory :user do
    first_name {Faker::FunnyName.name }
    last_name { Faker::FunnyName.name }
    email { Faker::Internet.email}
    password { 'aassdd' }
    password_confirmation { 'aassdd' }
  end
end
