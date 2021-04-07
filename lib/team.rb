class Team
  attr_reader :name, :coach, :players

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

  def positions_filled
    @players.map do |player|
      player.position
    end
  end

end
