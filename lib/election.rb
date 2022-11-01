class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    @races.map do |race|
      race.list_candidates
    end.flatten
  end

  def vote_counts
    vote_hash = {}
    candidates.each do |candidate|
      vote_hash[candidate.name] = get_vote_totals(candidate)
    end
    vote_hash
  end

  def get_vote_totals(selected_candidate)
    candidates.find do |candidate|
      return candidate.votes if candidate == selected_candidate
    end
  end

  def winners
    @races.map do |race|
      race.winner if !race.open?
    end.flatten
  end
end
