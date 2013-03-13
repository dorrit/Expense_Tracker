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
    it {should belong_to :vendor}

  end

  # context '#report_expense_date' do
  #   it 'returns expenses within a date range' do
  #     expense1 = Expense.create(:date => '20130201', :description => 'Jeans', :amount => 426.50, :category_id => 1, :vendor_id => 1)
  #     expense2 = Expense.create(:date => '20130215', :description => 'Wines', :amount => 250.00, :category_id => 2, :vendor_id => 2)
  #     expense3 = Expense.create(:date => '20130228', :description => 'Groceries', :amount => 289.15, :category_id => 3, :vendor_id => 2)
      
  
  #     Expense.report_expense_date(start_date, end_date).should match_array [expense1, expense2, expense3]
  #     #it { should ensure_inclusion_of(start_date, end_date).in_array([expense1, expense2, expense3]) }
  #   end
  # end


  context '#report_expense_date' do
    it 'returns expenses within a date range' do
      expenses_to_report = (1..2).to_a.map {|expense| FactoryGirl.create :expense}
      start_date = Date.parse('20130201')
      end_date = Date.parse('20130228')
      Expense.report_expense_date(start_date, end_date).should match_array expenses_to_report
    end
  end
end
