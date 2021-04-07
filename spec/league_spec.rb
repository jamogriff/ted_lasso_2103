require './lib/player'
require './lib/team'
require './lib/league'

RSpec.describe League do

  describe 'iteration 3' do
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

    it 'can access team captains' do
      expect(premier.captains[0]).to be_instance_of(Player)
      expect(premier.captains.count).to eq(2)
    end

    it 'can sort players by team' do
      expect(premier.players_by_team).to be_instance_of(Hash)
      expect(premier.players_by_team[richmond]).to eq(["Roy Kent", "Sam Obisanya"])
    end

  end

  describe 'iteration 4' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
    premier.add_team(richmond)
    premier.add_team(manchester)

    it 'returns most expensive player' do
      expect(premier.most_expensive_player).to eq(["Fernandinho"])
    end

    it 'sorts players by salary range' do
      result =  {
            "Over 0M" => ["Sam Obisanya"],
            "Over 1M" => ["Roy Kent", "Jamie Tartt"],
            "Over 2M" => [],
            "Over 3M" => [],
            "Over 4M" => [],
            "Over 5M" => ["Fernandinho"],
          }
      expect(premier.players_by_salary_range).to eq(result)
    end

  end
end
