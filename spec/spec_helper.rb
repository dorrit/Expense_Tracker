require 'active_record'
require 'rspec'
require 'shoulda-matchers'
require 'factory_girl'
require './spec/factories'

require 'expense'
require 'category'
require 'vendor'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Expense.all.each {|expense| expense.destroy}
    Category.all.each {|category| category.destroy}
    Vendor.all.each {|vendor| vendor.destroy}
  end
end