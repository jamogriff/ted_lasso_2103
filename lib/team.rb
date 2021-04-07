class Team
  attr_reader :name, :coach, :players,
              :total_salary, :captain, :positions_filled

  def initialize(team_name, coach_name, players)
    @name = team_name
    @coach = coach_name
    @players = players # passed in as array

  end

end
