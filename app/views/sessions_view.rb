class SessionsView
  def ask_for_username
    puts "What is your username?"
    gets.chomp
  end

  def ask_for_password
    puts "What is your password?"
    gets.chomp
  end

  def successful_login(employee)
    puts "You have been successfully logged in."
    puts "Welcome #{employee.username}"
  end

  def unsuccessful_login
    puts "Wrong credentials, try again"
  end
end
