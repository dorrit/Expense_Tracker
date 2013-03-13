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
    puts "\n\n  MAIN MENU"
    puts "Enter one of the following choices: "
    puts "'u' for user"
    puts "'a' for administrator"
    puts "'x' to exit"
    choice = gets.chomp
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
    puts "\n\n  USER MENU"
    puts "Enter one of the following choices: "
    puts "'a' to add a purchase"
    puts "'e' to edit a purchase"
    puts "'d' to delete a purchase"
    puts "'r' to access reports."
    puts "'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add_expense
    when 'd'
      delete_expense
    when 'r'
      menu_reports
    when 'x'
     
    else
      invalid
    end
  end
end

def menu_reports
  choice = nil
  until choice == 'x'
    puts "\n\n  REPORTS MENU"
    puts "Enter one of the following choices: "
    puts "'d' to view expenses by date"
    puts "'c' to view expenses by category"
    puts "'v' to view expenses by vendor"
    puts "'x' to exit"
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
    puts "\n\n  ADMIN MENU"
    puts "Enter one of the following choices: "
    puts "'c' to add a category"
    puts "'v' to add a vendor"
    puts "'dc' to delete a category" 
    puts "'dv' to delete a vendor."
    puts "'x' to exit."
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
  category_list
  puts "Enter the name of the category you would like to add."
  name = gets.chomp
  category = Category.new(:name => name)
  if category.save
    puts "#{name} has been added."
  else
    puts "That is not a valid category name."
  end
end

def add_vendor
  vendor_list
  puts "Enter the name of the vendor you would like to add."
  company = gets.chomp
  vendor = Vendor.new(:company => company)
  if vendor.save
    puts "#{company} has been added."
  else
    puts "That is not a valid vendor name."
  end
end

def delete_category
  category_list
  puts "Enter the number for the category you would like to anihilate?"
  category_id = gets.chomp
  category = Category.find(category_id)
  if category.destroy
    puts "#{name} has been anihilated!"
  else
    puts "#{name} is being used and cannot be deleted."
  end
end

def add_expense
  puts "\n\nEnter a date for your expense: "
  date = gets.chomp
  puts "Enter a description for your expense (100 characters max): "
  description = gets.chomp
  puts "Enter the amount of this expense: "
  amount = gets.chomp

  puts "\n\nPlease choose from the following list of categories:"
  category_list
  puts "Enter the category number for this expense: "
  category_id = gets.chomp
  # Category.where(:name => name).pop.id
  category = Category.find(category_id)

  puts "\n\nPlease choose from the following list of vendors:"
  vendor_list
  puts "\n\nEnter the vendor number for this expense: "
  vendor_id = gets.chomp
  vendor = Vendor.find(vendor_id)
  record = vendor.expenses.build(:date => date, :description => description, :amount => amount, :category_id => category_id)
  puts "#{record.date} \t #{record.description} \t $#{record.amount.class} has been added."
end

def category_list
  categories = Category.all
  categories.each {|category| puts "#{category.id} \t #{category.name}"}
end

def vendor_list
  vendors = Vendor.all 
  vendors.each {|vendor| puts "#{vendor.id} \t #{vendor.company}"}
end








welcome