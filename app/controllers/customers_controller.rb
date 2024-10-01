require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # get all the customers (REPO)
    customers = @customer_repository.all
    # display a list of customers (VIEW)
    @customers_view.display_list(customers)
  end

  def add
    # ask the user for a name (VIEW)
    customer_name = @customers_view.ask_for_name
    # ask the user for a address (VIEW)
    customer_address = @customers_view.ask_for_address
    # make an instance of customer (MODEL)
    new_customer = Customer.new(name: customer_name, address: customer_address)
    # create it in the repo (REPO)
    @customer_repository.create(new_customer)
  end
end
