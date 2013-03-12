class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :expenses
  validates :name, :length => { :minimum => 5, :maximum => 25 }

end