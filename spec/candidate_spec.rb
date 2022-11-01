require './lib/candidate'

RSpec.describe Candidate do
  let(:candidate) {Candidate.new({name: "Diana D", party: :democrat})}
  
  it 'has a hash input that determines name and party, which are accessible' do
    expect(candidate).to be_a(Candidate)
    expect(candidate.name).to eq("Diana D")
    expect(candidate.party).to eq(:democrat)
  end

  it 'starts with zero votes' do
    expect(candidate.votes).to eq(0)
  end

  it 'has a method to vote for candidate which increases tally by 1' do
    candidate.vote_for!
    expect(candidate.votes).to eq(1)
    candidate.vote_for!
    expect(candidate.votes).to eq(2)
    candidate.vote_for!
    expect(candidate.votes).to eq(3)
  end
end