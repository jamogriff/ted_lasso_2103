class League
  attr_reader :name, :teams

  def initialize(league_name)
    @name = league_name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

end
