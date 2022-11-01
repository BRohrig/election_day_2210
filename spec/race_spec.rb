require './lib/race'
require './lib/candidate'

RSpec.describe Race do
  let(:race) {Race.new("Seattle Mayor")}

  it 'exists and has an office title which is accessible' do
    expect(race).to be_a(Race)
    expect(race.office).to eq("Seattle Mayor")
  end

  it 'has an array of candidates that starts empty' do
    expect(race.candidates).to eq([])
  end

  it 'has a method to register a candidate and put them in the candidates array' do
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

    expect(candidate1).to be_a(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)
    expect(candidate2).to be_a(Candidate)
    expect(candidate2.name).to eq("Roberto R")
    expect(candidate2.party).to eq(:republican)
    expect(race.candidates).to eq([candidate1, candidate2])
  end

  it 'has an #open? method that returns true by default' do
    expect(race.open?).to be true
  end

  it 'has a method to close the race which will impact the open? method' do
    race.close!
    expect(race.open?).to be false
  end

  it 'has a winner method that returns false if race is open, if close will return candidate with most votes' do
    expect(race.winner).to be false
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    3.times {candidate1.vote_for!}
    4.times {candidate2.vote_for!}
    expect(race.winner).to be false
    race.close!
    
    expect(race.winner).to eq([candidate2])
    expect(race.tie?).to be false
  end

  it 'has a method to evaluate if there is a tie' do
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    4.times {candidate1.vote_for!}
    4.times {candidate2.vote_for!}
    race.close!

    expect(race.tie?).to be true
    expect(race.winner).to eq([candidate1, candidate2])

  end

  


end