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

  context 'date_scopes' do
    it 'returns all dates that are after the beginning date' do
      expenses_after_date = ['20020101', '20030202', '20060204'].map {|date| FactoryGirl.create(:expense, :date => date)}
      expenses_before_date = ['10020101', '10030202', '10060204'].map {|date| FactoryGirl.create(:expense, :date => date)}
      Expense.after_date("20010404").should match_array expenses_after_date
    end

    it 'returns all dates that are before the beginning date' do
      expenses_after_date = ['20020101', '20030202', '20060204'].map {|date| FactoryGirl.create(:expense, :date => date)}
      expenses_before_date = ['10020101', '10030202', '10060204'].map {|date| FactoryGirl.create(:expense, :date => date)}
      Expense.before_date("20010404").should match_array expenses_before_date
    end
  end

  context '#vendor_expense' do
    it 'returns expenses for a specified vendor' do
      expenses = (1..5).to_a.map {|expense| FactoryGirl.create(:expense, :vendor_id => '1')}
      Expense.vendor_expense(1).should match_array expenses
    end
  end

    context '#vendor_expense' do
    it 'returns expenses for a specified vendor' do
      expenses = (1..5).to_a.map {|expense| FactoryGirl.create(:expense, :vendor_id => '1')}
      Expense.vendor_expense(2).should eq []
    end
  end
end


