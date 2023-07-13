class Player
  attr_reader :first_name, :last_name
  def initialize(name, monthly_cost, total_cost)
    @first_name = name.split.first
    @last_name = name.split.last
  end
end