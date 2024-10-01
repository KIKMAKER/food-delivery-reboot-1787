require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # get all the meals (REPO)
    meals = @meal_repository.all
    # display a list of meals (VIEW)
    @meals_view.display_list(meals)
  end

  def add
    # ask the user for a name (VIEW)
    meal_name = @meals_view.ask_for_name
    # ask the user for a price (VIEW)
    meal_price = @meals_view.ask_for_price
    # make an instance of meal (MODEL)
    new_meal = Meal.new(name: meal_name, price: meal_price)
    # create it in the repo (REPO)
    @meal_repository.create(new_meal)
  end
end
