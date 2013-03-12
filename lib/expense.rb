class Expense < ActiveRecord::Base
  validates :date, :description, :amount, :presence => true
  belongs_to :category

end