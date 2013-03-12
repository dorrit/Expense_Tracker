class Vendor < ActiveRecord::Base
  validates :company, :presence => true, :uniqueness => true
  validates :company, :length => { :minimum => 2, :maximum => 25 }

  has_many :expenses

  
end