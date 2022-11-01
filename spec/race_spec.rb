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


end