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

  end
end
