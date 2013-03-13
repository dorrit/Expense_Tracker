class Expense < ActiveRecord::Base
  validates :date, :description, :amount, :presence => true
  validates :description, :length => { :minimum => 5, :maximum => 100 }


  belongs_to :category



end