FactoryBot.define do
  factory :user do
    username { "MyString" }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
