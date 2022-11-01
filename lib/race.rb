require './lib/candidate'

class Race
  attr_reader :office, :candidates

  def initialize(office_name)
    @office = office_name
    @candidates = []
    @open = true
  end

  def register_candidate!(input_hash)
    candidate = Candidate.new(input_hash)
    put_in_race(candidate)
    candidate
  end

  def put_in_race(candidate)
    @candidates << candidate
  end

  def list_candidates
    @candidates.map do |candidate| 
      candidate
    end
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if open?
    sort_by_votes.find_all do |candidate|
      candidate if candidate.votes == sort_by_votes.last.votes
    end
  end

  def sort_by_votes
    list_candidates.sort_by { |candidate| candidate.votes}
  end

  def tie?
    if winner.count > 1
      true
    else
      false
    end
  end
end