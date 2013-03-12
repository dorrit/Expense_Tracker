require 'active_record'
require './lib/expense'
require './lib/category'
require './lib/vendor'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

def welcome
  puts "Welcome to Expense Tracker!"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Type 'u' for user mode,'a' for administrator mode or 'x' to exit."
    case choice
    when 'u'
      menu_user
    when 'a'
      menu_admin
    when 'x'
      exit
    else
      invalid
    end
  end
end

def menu_user
  choice = nil
  until choice == 'x'
    puts "Type 'a' to add a purchase, or 'd' to delete a purchase or 'r' to access reports."
    puts "Type 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add_expense
    when 'd'
      delete_expense
    when 'r'
      menu_reports
    when 'x'
      exit
    else
      invalid
    end
  end
end

def menu_reports
  choice = nil
  until choice == 'x'
    puts "Type 'd' to view expenses by date, 'c' to view expenses by category or 'v' to view expenses by vendor."
    puts "Type 'x' to exit."
    choice = gets.chomp
    case choice
    when 'd'
      expenses_by_date
    when 'c'
      expenses_by_category
    when 'v'
      expenses_by_vendor
    when 'x'
      exit
    else
      invalid
    end
  end
end

def menu_admin
  choice = nil
  until choice == 'x'
    puts "Type 'c' to add a category, 'v' to add a vendor, 'dc' to delete a category or 'dv' to delete a vendor."
    puts "Type 'x' to exit."
    choice = gets.chomp
    case choice
    when 'c'
      add_category
    when 'v'
      add_vendor
    when 'dc'
      delete_category
    when 'dv'
      delete_vendor
    when 'x'
      exit
    else
      invalid
    end
  end
end

def add_category
  puts "Enter the name of the category you would like to add."
  category_name = gets.chomp
  category = Category.new(:name => :category_name)
  if category.save
    puts "#{category_name} has been added."
  else
    puts "That was not a valid category name."
  end
end