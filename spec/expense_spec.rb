require 'spec_helper'

describe Expense do
  context 'validations' do 
    it {should validate_presence_of :date}
    it {should validate_presence_of :description}
    it {should validate_presence_of :amount}
    it { should ensure_length_of(:description).is_at_least(5).is_at_most(100) }

  end

  context 'associations' do
    it {should belong_to :category}

  end
  
end