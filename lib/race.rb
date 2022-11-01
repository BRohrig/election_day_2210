require './lib/candidate'

class Race
  attr_reader :office, :candidates

  def initialize(office_name)
    @office = office_name
    @candidates = []
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
end
