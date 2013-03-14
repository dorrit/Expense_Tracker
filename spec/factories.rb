FactoryGirl.define do

  factory :expense do
    date '20130201'
    description 'chocolate'
    amount 27.93
    association :vendor, :factory => :vendor
    association :category, :factory => :category
  end

  factory :vendor do
    sequence(:company) {|n| "lululemon#{n}" }
  end

  factory :category do
    sequence(:name) {|n| "stuff#{n}" }
  end
end