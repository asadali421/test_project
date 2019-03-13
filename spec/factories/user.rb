FactoryBot.define do
  factory :user do
    name { 'amjad' }
    email { 'amjad@gmail.com' }
    password { 'jinlian' }
    user_type { 'Manager' }

    trait :qa_user do
      user_type { 'QA' }
    end

    trait :developer_user do
      user_type { 'Developer' }
    end    
  end
end