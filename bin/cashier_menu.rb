
def cashier_menu(cashier)
  puts `clear`
  puts "Welcome, #{cashier.name}"
  user_choice = nil
  until user_choice == 'x'
    puts "Enter 'n' to create a new transaction"
    puts "Enter 'x' to exit"
    user_choice = gets.chomp.downcase
    case user_choice
    when 'n'
      new_transaction(cashier)
    when 'x'
      puts "Logging out"
    end
  end
end

def new_transaction(cashier)
  puts `clear`
  puts "New Transaction: "
  transaction = cashier.transactions.create
  user_choice = nil
  until user_choice == 'x'
    puts "\n  Enter 'a' to add an item to the transaction"
    puts "\t'e' to edit the quantity of an item"
    puts "\t'd' to delete an item"
    puts "\t'x' to end the transaction"
    user_choice = gets.chomp.downcase
    case user_choice 
    when 'a'
      add_item(transaction)
    when 'e'
      edit_item(transaction)
    when 'd'
      delete_item(transaction)
    when 'x'
      print_receipt(transaction)
    end
  end
end

def add_item(transaction)
  show_products
  puts "\nEnter the name of the product to add:"
  product = Product.where(:name => gets.chomp).first
  puts "Enter the amount of the product:"
  amount = gets.chomp
  if !product.nil?
    transaction.purchases.create(:product => product, :quantity => amount.to_i)
  else
    puts 'Product does not exist'
  end
end

def edit_item(transaction)
  transaction.products.each {|product| puts product.name}
  puts "\nEnter a product name to edit its amount:"
  product = transaction.products.where(:name => gets.chomp).first
  if !product.nil?
    purchase = transaction.purchases.where(:product => product).first
    puts "#{product.name}, purchasing #{purchase.quantity}"
    puts 'Enter a new quantity:'
    new_quantity = gets.chomp.to_i
    purchase.update(:quantity => new_quantity)
  else
    puts "Invalid selection"
  end
end

def delete_item(transaction)
  transaction.products.each {|product| puts "#{product.name}, qty: #{transaction.purchases.where(:product => product).take.quantity}"}
  puts "\nEnter a product name to delete it:"
  product = transaction.products.where(:name => gets.chomp).first
  if !product.nil?
    purchase = transaction.purchases.where(:product => product).first
    puts "#{product.name}, purchasing #{purchase.quantity}"
    puts "Delete?(y/n)"
    purchase.destroy if gets.chomp.downcase == 'y'
  else
    puts "Invalid selection"
  end
end

def print_receipt(transaction)
  puts `clear`
  puts "Receipt for #{transaction.id}"
  transaction.purchases.each do |purchase|
    puts "#{purchase.product.name}, $#{'%.2f' % purchase.product.price}/ct, qty: #{purchase.quantity}".ljust(30) + "$#{'%.2f' % purchase.total}".rjust(25)
  end
  puts " ".ljust(30) + "#{'%.2f' % transaction.total}".rjust(25)
end


