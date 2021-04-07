require './lib/player'

RSpec.describe Player do

  describe "#initialize" do
    player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})

    it 'exists' do
      expect(player).to be_instance_of(Player)
    end

    it 'can access instance vars from hash' do
      expect(player.name).to eq("Roy Kent")
      expect(player.position).to eq("Center Midfielder")
      expect(player.salary).to eq(1_000_000)
    end
  end

end
