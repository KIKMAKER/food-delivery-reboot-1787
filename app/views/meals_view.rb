class MealsView
  def display_list(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}, for $#{meal.price}"
    end
  end


  def ask_for_name
    puts "So you wanna add a meal. huh? What's it called?"
    gets.chomp
  end

  def ask_for_price
    puts "What's it worth"
    gets.chomp.to_i
  end
end
