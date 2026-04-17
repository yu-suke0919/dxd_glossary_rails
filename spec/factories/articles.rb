FactoryBot.define do
  factory :article do
    association :user
    title { 'taitoru' }
    category { 'a' }
    description { 'kizyutu' }
  end
end
