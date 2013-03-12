require 'spec_helper'

describe Expense do
  context 'validations' do 
    it {should validate_presence_of :date}
    it {should validate_presence_of :description}
    it {should validate_presence_of :amount}    

  end

  context 'associations' do
    it {should belong_to :category}

  end
  
end