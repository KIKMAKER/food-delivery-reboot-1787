require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @employees = []
    @csv_file_path = csv_file_path
    load_csv if File.exist?(csv_file_path)
  end

  def find_by_username(username)
    # go through the employees array
    @employees.find do |employee|
      # find the employee with the given username
      employee.username == username
    end
    # .find returns the first instance that meets the given condition
  end


  private

  def load_csv
    # open the csv and go through each row
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # <CSV::Row id:"1" username:"Jojo" password:"secret" role:"rider">
      # convert data types as necessary
      row[:id] = row[:id].to_i
      # create a new employee for each row
      employee = Employee.new(row)
      # p employee
      # add it to the employees array
      @employees << employee
    end
  end
end


# test_employee_repo = EmployeeRepository.new("/Users/kiki/code/lewagon/livecodes/food-delivery-reboot-1787/data/employees.csv")

# p test_employee_repo
