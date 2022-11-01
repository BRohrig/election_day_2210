class Candidate
  attr_reader :name, :party, :votes

  def initialize(input_hash)
    @name = input_hash[:name]
    @party = input_hash[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end

end
