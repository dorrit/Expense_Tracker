require 'active_record'
require './lib/task'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

def welcome
  puts "Welcome to the Expense Tracker!"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Enter 'u' for user mode,'a' for administrator mode or 'x' to exit."
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


def menu_admin
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a purchase, 'l' to list your tasks, or 'd' to mark a task as done."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'd'
      mark_done
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
    puts "Press 'a' to add a purchase, 'l' to list your tasks, or 'd' to mark a task as done."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'd'
      mark_done
    when 'x'
      exit
    else
      invalid
    end
  end
end