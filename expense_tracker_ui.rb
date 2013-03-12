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
  #list all categories
  puts "Enter the name of the category you would like to add."
  name = gets.chomp
  category = Category.new(:name => name)
  if category.save
    puts "#{name} has been added."
  else
    puts "That is not a valid category name."
  end
end

def delete_category
  #list all categories
  puts "Enter the name of the category you would like to destroy."
  name = gets.chomp
  category = Category.where(:name => name).pop
  if category.destroy
    puts "#{name} has been anihilated!"
  else
    puts "#{name} is being used and cannot be deleted."
  end
end












welcome