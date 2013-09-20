require 'active_record'

require '../lib/cashier'
require '../lib/product'
require '../lib/transaction'
require '../lib/purchase'
require './cashier_menu'

ActiveRecord::Base.establish_connection(YAML::load(File.open('../db/config.yml'))["development"])

def welcome
  puts `clear`
  puts 'Welcome to this PoS'
  puts 'Are you [a]dmin or a [c]ashier?'
  input = gets.chomp.downcase
  if input == 'a'
    admin_menu
  elsif input == 'c'
    login_menu
  else
    puts 'Invalid input'
  end
end

def login_menu
  puts 'Enter your name:'
  name = gets.chomp
  puts 'Enter your password:'
  password = gets.chomp
  cashier = Cashier.where(:name => name, :password => password).first
  if !cashier.nil?
    cashier_menu(cashier)
  else
    puts "Invalid entry. Try again."
    login_menu
  end
end

def admin_menu
  puts `clear`
  begin
    puts 'Would you like to change [p]roducts or [c]ashiers, or e[x]it?'
    input = gets.chomp.downcase
    if input == 'p'
      product_menu
    elsif input == 'c'
      admin_cashier_menu
    end
  end until input == 'x'
  puts 'Logging out'
end

def product_menu
  user_choice = nil
  until user_choice == 'x'
    puts "\n  Enter 'a' to add a new product"
    puts "\t'd' to delete a product"
    puts "\t'e' to edit a product"
    puts "\t'x' to return to the previous menu"
    user_choice = gets.chomp.downcase
    case user_choice
    when 'a'
      add_product
    when 'd'
      delete_product
    when 'e'
      edit_product
    when 'x'
      puts 'Returning to previous menu'
    end
  end
end

def add_product
  begin
    puts "Enter a new product name:"
    name = gets.chomp
    puts "Enter a price (eg. 4.00):"
    price = gets.chomp.to_f
    Product.create( :name => name, :price => price)
    puts "Do you want to make another product (Y/n)?"
    answer = gets.chomp.downcase
  end until answer == 'n'
end

def delete_product
  puts `clear`
  puts 'Delete Product: '
  puts "\nEnter the name of the product you would like to delete: "
  product_name = gets.chomp
  product = Product.where(:name => product_name).first
  if !product.nil?
    product.destroy
    puts "Product successfully deleted."
  else
    puts "Product does not exist"
  end
end

def edit_product
  puts `clear`
  puts 'Edit Product:'
  puts "\nEnter the name of the product you would like to edit:"
  product_name = gets.chomp
  product = Product.where(:name => product_name).first
  if !product.nil?
    puts "Product name is '#{product.name}', enter a new name:"
    name = gets.chomp
    puts "Product price is $#{'%.2f' % product.price}, enter a new price:"
    price = gets.chomp.to_f
    product.update(:name => name, :price => price)
  else
    puts 'Product does not exist'
  end
end

def add_cashier
  begin
    puts "Enter a new cashier name:"
    name = gets.chomp
    puts "Enter a password:"
    password = gets.chomp
    Cashier.create( :name => name, :password => password)
    puts 'Do you want to add another cashier(y/n)?'
    answer = gets.chomp.downcase
  end until answer == 'n'
end

def admin_cashier_menu
  user_choice = nil
  until user_choice == 'x'
    puts "\n  Enter 'a' to add a new cashier"
    puts "\t'd' to delete a cashier"
    puts "\t'e' to edit a cashier"
    puts "\t'x' to return to the previous menu"
    user_choice = gets.chomp.downcase
    case user_choice
    when 'a'
      add_cashier
    when 'd'
      delete_cashier
    when 'e'
      edit_cashier
    when 'x'
      puts 'Returning to previous menu'
    end
  end
end

def delete_cashier
  puts `clear`
  puts 'Delete Cashier: '
  puts "\nEnter the name of the cashier you would like to delete: "
  cashier_name = gets.chomp
  cashier = Cashier.where(:name => cashier_name).first
  if !cashier.nil?
   cashier.destroy
    puts "Cashier successfully deleted."
  else
    puts "Cashier does not exist"
  end
end

def edit_cashier
  puts `clear`
  puts 'Edit Cashier:'
  puts "\nEnter the name of the cashier you would like to edit:"
  cashier_name = gets.chomp
  cashier = Cashier.where(:name => cashier_name).first
  if !cashier.nil?
    puts "Cashier name is '#{cashier.name}', enter a new name:"
    name = gets.chomp
    cashier.update(:name => name)
  else
    puts 'Cashier does not exist'
  end
end

def show_products
  Product.all.each {|product| puts "#{product.name}, Price: #{'%.2f' % product.price}"}
end








































welcome



