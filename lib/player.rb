class Player
  attr_reader :first_name, :last_name, :monthly_cost, :contract_length
  def initialize(name, monthly_cost, contract_length)
    @first_name = name.split.first
    @last_name = name.split.last
    @monthly_cost = monthly_cost
    @contract_length = contract_length
  end
end