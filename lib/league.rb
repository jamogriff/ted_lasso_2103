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

  # Pretty hacky way to fulfill implementation
  # Utilizes #captains instead of iterating over all
  # players, so not perfect.
  def most_expensive_player
    highest_paid = captains[-1]
    second_highest = captains[-2]
    most_expensive = []
    if highest_paid.salary == second_highest.salary
      most_expensive << highest_paid.name
      most_expensive << second_highest.name
    else
      most_expensive << highest_paid.name
    end
    #require 'pry'; binding.pry
  end

  def players_by_salary_range
    hash = {}
    @teams.each do |team|
      hash["Over 0M"] = players_by_salary(0)
      hash["Over 1M"] = players_by_salary(1000000)
      hash["Over 2M"] = players_by_salary(2000000)
      hash["Over 3M"] = players_by_salary(3000000)
      hash["Over 4M"] = players_by_salary(4000000)
      hash["Over 5M"] = players_by_salary(5000000)
    end
    hash
  end

  def players_by_salary(salary)
     playas = @teams.map do |team|
      team.players.select do |player|
        player.salary >= salary &&
        player.salary < (salary + 1000000)
      end
    end
    da_playas = playas.flatten
    da_playas.map do |playa|
     playa.name
    end
  end
end
