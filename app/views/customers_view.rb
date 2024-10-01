class CustomersView
  def display_list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}, at #{customer.address}"
    end
  end


  def ask_for_name
    puts "So you wanna add a customer. huh? What's their name?"
    gets.chomp
  end

  def ask_for_address
    puts "Where do they live?"
    gets.chomp
  end
end
