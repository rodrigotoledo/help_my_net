FactoryBot.define do
  factory :message do
    task { nil }
    user { nil }
    author { nil }
    message { "MyString" }
  end
end
