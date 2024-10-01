class Employee
  attr_reader :username, :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager"
  end
end

# rider = Employee.new(id: 1, username: "Jojo", password: "secret", role: "rider")


# p rider.username # => "Jojo"

# p rider.manager?
