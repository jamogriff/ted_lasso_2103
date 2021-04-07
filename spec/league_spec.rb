require './lib/player'
require './lib/team'
require './lib/league'

RSpec.describe League do

  describe '#initialize' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    it 'exists' do
      expect(premier).to be_instance_of(League)
    end

    it 'can access instance vars' do
      expect(premier.name).to eq("Premier League")
      expect(premier.teams).to be_instance_of(Array)
    end

    it 'can add teams' do
      premier.add_team(richmond)
      premier.add_team(manchester)
      expect(premier.teams.count).to eq(2)
    end

  end
end
