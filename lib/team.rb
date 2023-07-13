class Team
  attr_reader :roster
  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
  end

  def player_count
    @roster.length
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    @roster.find_all do |player|
      player.contract_length > 24
    end
  end

  def short_term_players
    @roster.find_all do |player|
      player.contract_length <= 24
    end
  end

  def total_value
    sum_value = 0

    @roster.each do |player|
      sum_value += player.total_cost
    end

    sum_value
  end
end