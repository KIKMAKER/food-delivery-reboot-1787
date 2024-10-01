require_relative '../views/sessions_view'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # ask for username (VIEW)
    username = @sessions_view.ask_for_username
    # ask for password (VIEW)
    password = @sessions_view.ask_for_password
    # look for the user in the employee repository (REPO)
    employee = @employee_repository.find_by_username(username)
    # if it exists and the password given matches that employees password
    if employee && employee.password == password
      # print a welcome message (VIEW)
      @sessions_view.successful_login(employee)
      # return employee
      return employee
    # else print an error message
    else
      @sessions_view.unsuccessful_login
      # run the login method again
      login
    end
  end
end
