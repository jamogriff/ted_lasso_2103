class Team
  attr_reader :name, :coach, :players,
              :captain, :positions_filled

  def initialize(team_name, coach_name, players)
    @name = team_name
    @coach = coach_name
    @players = players # passed in as array

  end

  def total_salary
    @players.sum do |player|
      player.salary
    end
  end

  def captain
    @players.max_by do |player|
      player.salary
    end.name
  end

end
