class League
  attr_reader :name, :teams

  def initialize(league_name)
    @name = league_name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.players.max_by do |player|
        player.salary
      end
    end
  end

  def players_by_team
    hash = {}
    @teams.each do |team|
      hash[team] = team.players.map { |player| player.name }
    end
    hash
  end

end
