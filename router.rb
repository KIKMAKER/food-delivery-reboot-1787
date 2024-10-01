# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_options
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  def display_options
    puts "What do ya wanna do?"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - quit"
  end

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then stop
    else
      puts "not an option buddy"
    end
  end

  def stop
    @running = false
  end
end
