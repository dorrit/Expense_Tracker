require 'spec_helper'

describe Category do 
  context 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :name}
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(25) }
  end

  context 'associations' do
    it {should have_many :expenses}
  end

  context 'callbacks' do 
    it 'converts the name to title case' do 
      category = FactoryGirl.create(:category, :name => "toilet paper")
      category.name.should eq "Toilet paper"
    end
  end
end



