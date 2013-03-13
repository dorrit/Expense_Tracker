FactoryGirl.define do

  factory :expense do
    date '20130201'
    description 'chocolate'
    amount 27.93
    # vendor_id 1
    # category_id 2
    association :vendor, :factory => :vendor
    association :category, :factory => :category
  end

  factory :vendor do
    # company 'lululemon'
    sequence(:company) {|n| "lululemon#{n}" }
  end

  factory :category do
    # name 'stuff'
    sequence(:name) {|n| "stuff#{n}" }
  end

end