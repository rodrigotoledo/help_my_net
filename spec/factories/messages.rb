FactoryBot.define do
  factory :message do
    task { create(:task) }
    user { create(:user) }
    message { "MyString" }
  end
end
