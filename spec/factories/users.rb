FactoryBot.define do
  factory :user do
    first_name {['John','Sam', 'Ross','Joey'].sample}
    last_name {['John','Sam', 'Ross','Joey'].sample}
    sequence(:email) {|n| "test-#{n.to_s.rjust(3, '0')}@gmail.com"}
    password {'123456'}

    trait :admin do
      admin {true}
    end

    trait :company_user do
      admin {false}
    end
  end
end