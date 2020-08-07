FactoryBot.define do
  factory :stand_up do
    name { ['Rails','React','Optimization','Test','Refactoring'].sample }
    hours { [1, 2, 2.5, 3, 3.5, 4].sample }
    info {['Lorem ipsum dolor sit amet', 'consectetur adipiscing elit', 'Ut enim ad minim veniam'].sample}
    association :user, :company_user 
  end
end