require './lib/player'
require './lib/team'

RSpec.describe Team do
  describe "#initialize" do
    it "exists" do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team).to be_a(Team)
    end
  end

  describe "#roster" do
    it "starts as an empty array" do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.roster).to eq([])
    end

    it "returns an array of players" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous", 1000000, 36)

      team.add_player(player_1)
    
      expect(team.roster).to eq([player_1])
    end
  end

  describe "#player_count" do
    it "starts as 0" do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.player_count).to eq(0)
    end

    it "returns the number of players on a team" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous", 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)

      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.player_count).to eq(2)
    end
  end

  describe "#add_player" do
    it "adds a player to the team roster" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous", 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)

      team.add_player(player_1)
      team.add_player(player_2)
    
      expect(team.roster).to eq([player_1, player_2])
    end
  end

  describe "#long_term_players" do
    it "returns an array of players with contract length > 2 years" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq([player_1, player_3])
    end
  end

  describe "#short_term_players" do
    it "returns an array of players with contract length <= 2 years" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.short_term_players).to eq([player_4, player_2])
    end
  end

  describe "#total_value" do
    it "returns the sum of all players total values" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq(85200000)
    end
  end

  describe "#details" do
    it "returns a hash of total_value and player_count for a team" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.details).to eq({"total_value" => 85200000, "player_count" => 4})
    end
  end

  describe "#average_cost_of_player" do
    it "returns a string of the average cost of players total value, formatted as a currency" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.average_cost_of_player).to eq("$21,300,000")
    end
  end

  describe "#players_by_last_name" do
    it "returns a string of players sorted by last name alphabetically ascending" do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)

      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.players_by_last_name).to eq("DeNunez, McClennan, Palledorous, Porter")
    end
  end
end