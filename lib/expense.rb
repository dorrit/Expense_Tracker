class Expense < ActiveRecord::Base
  validates :date, :description, :amount, :presence => true
  validates :description, :length => { :minimum => 5, :maximum => 100 }


  belongs_to :category
  belongs_to :vendor

  def self.report_expense_date(start_date, end_date)
    Expense.where(:date => start_date..end_date)
  end



end