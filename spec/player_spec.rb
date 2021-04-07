require './lib/player'

RSpec.describe Player do

  describe "#initialize" do
    player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})

    it 'exists' do
      expect(player).to be_instance_of(Player)
    end
  end

end
