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
  end

  describe "#player_count" do
    it "starts as 0" do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.player_count).to eq(0)
    end
    
    it "returns the number of players on a team" do

    end
  end
end