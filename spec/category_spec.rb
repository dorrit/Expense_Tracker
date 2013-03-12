require 'spec_helper'

describe Category do 
  context 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :name}
    it { should ensure_length_of(:name).is_at_least(5).is_at_most(25) }
  end

  context 'associations' do
    it {should have_many :expenses}
  end

end