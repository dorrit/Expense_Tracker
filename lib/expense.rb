class Expense < ActiveRecord::Base
  validates :date, :description, :amount, :presence => true
  validates :description, :length => { :minimum => 5, :maximum => 100 }


  belongs_to :category
  belongs_to :vendor

  scope :after_date, lambda { |time| where("date > ?", time)}
  scope :before_date, lambda { |time| where("date < ?", time)}


  scope :vendor_expense, lambda {|vendor| where("vendor_id = ?", vendor)}
  
# def 
#     Expense.joins(:vendor => :company).where(:company => {:vendor_id => 1})
#     Post.joins(:group => :memberships).where(:memberships => {:user_id => 1})

# end

  # client = Client.find_by_first_name("Ryan")
  # orders = client.orders.scoped

end

# def self.report_expense_date(start_date, end_date)
  #   # Expense.where(:date => start_date..end_date)

  # end


