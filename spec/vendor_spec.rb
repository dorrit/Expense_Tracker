require 'spec_helper'

describe Vendor do 
  context 'validations' do 
    it {should validate_presence_of :company}
    it {should validate_uniqueness_of :company}
    it {should ensure_length_of(:company).is_at_least(2).is_at_most(25)}
  end


  context 'associations' do
    it {should have_many :expenses}

  end

  

end