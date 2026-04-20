FactoryBot.define do
  factory :user do
    name { "test_name" }
    email { "test_email" }
    password { "test_password" }
    password_confirmation { "test_password" }
  end
end
