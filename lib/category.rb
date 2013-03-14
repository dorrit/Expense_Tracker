class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :name, :length => { :minimum => 2, :maximum => 25 }

  has_many :expenses

  before_save :capitalize_name

  private
  def capitalize_name
    self.name = self.name.capitalize
  end
end