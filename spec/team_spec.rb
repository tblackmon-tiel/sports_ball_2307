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
end