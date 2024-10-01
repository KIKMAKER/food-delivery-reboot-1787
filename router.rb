# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          display_manager_options
          action = gets.chomp.to_i
          route_manager_action(action)
        else
          display_rider_options
          action = gets.chomp.to_i
          route_rider_action(action)
        end
      end
    end
  end

  def display_manager_options
    puts "What do ya wanna do?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "5 - MANAGER SPECIFIC THINGS"
    puts "8 - Logout"
    puts "9 - quit"
  end

  def display_rider_options
    puts "What do ya wanna do?"
    puts "1 - RIDER SPECIFIC THINGS"
    puts "8 - Logout"
    puts "9 - quit"
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then logout!
    when 9 then stop
    else
      puts "not an option buddy"
    end
  end

  def route_rider_action(action)
    case action
    when 1 then @meals_controller.list
    when 8 then logout!
    when 9 then stop
    else
      puts "not an option buddy"
    end
  end

  def logout!
    @current_user = nil
  end

  def stop
    logout!
    @running = false
  end
end
