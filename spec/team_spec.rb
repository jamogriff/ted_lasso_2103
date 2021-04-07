require './lib/player'
require './lib/team'

RSpec.describe 'Team' do

  describe '#initialize' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

    it 'exists' do
      expect(team).to be_instance_of(Team)
    end

    it 'can access instance vars passed as arguments' do
      expect(team.name).to eq("AFC Richmond")
      expect(team.coach).to eq("Ted Lasso")
      expect(team.players).to eq([roy, sam])
    end

    it 'can calculate #total_salary' do
      expect(team.total_salary).to eq(1600000)
    end

    it 'can find the captain' do
      expect(team.captain).to eq("Roy Kent")
    end

    it 'returns positions filled' do
      expect(team.positions_filled).to eq(["Center Midfielder", "Right-back Defender"])
    end
  end
end
