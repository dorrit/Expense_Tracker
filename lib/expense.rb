class Expense < ActiveRecord::Base
  validates :date, :description, :amount, :presence => true
  validates :description, :length => { :minimum => 5, :maximum => 100 }

  belongs_to :category
  belongs_to :vendor

  scope :after_date, lambda { |time| where("date > ?", time)}
  scope :before_date, lambda { |time| where("date < ?", time)}
  scope :vendor_expense, lambda {|vendor| where("vendor_id = ?", vendor)}
  scope :category_expense, lambda {|category| where("category_id = ?", category)}

end