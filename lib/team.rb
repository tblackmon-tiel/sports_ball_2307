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

  def details
    {"total_value" => total_value, "player_count" => player_count}
  end
  
  def average_cost_of_player
    average_as_int = total_value / player_count
    average_as_string = ""

    # adds each digit to a string in reverse order, adding a comma every 3 digits
    average_as_int.digits.each_index do |index|
      average_as_string << average_as_int.digits[index].to_s
      #require 'pry'; binding.pry
      if (index + 1) % 3 == 0
        average_as_string << ","
      end
    end

    # un-reverse the string, add the $
    "$#{average_as_string.reverse}"
  end

  def players_by_last_name
    string_of_names = ""
    last_names = @roster.map do |player|
      player.last_name
    end
    
    last_names.sort.each do |name|
      string_of_names << "#{name}, "
    end

    string_of_names.chomp(", ")
  end
end