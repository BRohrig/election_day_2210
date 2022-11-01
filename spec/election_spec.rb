require './lib/election'
require './lib/race'
require './lib/candidate'

RSpec.describe Election do
  let(:election) {Election.new("2022")}
  let(:race1) {Race.new("Virginia District 4 Representative")}
  let(:race2) {Race.new("Texas Governor")}
  let(:candidate1) {race1.register_candidate!({name: "Diana D", party: :democrat})}
  let(:candidate2) {race1.register_candidate!({name: "Roberto R", party: :republican})}
  let(:candidate3) {race2.register_candidate!({name: "Diego D", party: :democrat})}
  let(:candidate4) {race2.register_candidate!({name: "Rita R", party: :republican})}
  let(:candidate5) {race2.register_candidate!({name: "Ida I", party: :independent})}

  it 'exists and has a year attribute' do
    expect(election).to be_a(Election)
    expect(election.year).to eq("2022")
  end

  it 'has a races array that starts empty, and can have races added to it' do
    expect(election.races).to eq([])
    election.add_race(race1)
    expect(election.races).to eq([race1])
    election.add_race(race2)
    expect(election.races).to eq([race1, race2])
  end

  it 'can list all the candidates in the various races' do
    election.add_race(race1)
    candidate1
    candidate2
    election.add_race(race2)
    candidate3
    candidate4
    candidate5
    expect(election.candidates).to eq([candidate1, candidate2, candidate3, candidate4, candidate5])
  end

  it 'keeps tally of each candidates vote total, as a hash' do
    election.add_race(race1)
    election.add_race(race2)
    candidate1
    candidate2
    candidate3
    candidate4
    candidate5
    4.times {candidate1.vote_for!}
    1.times {candidate2.vote_for!}
    10.times {candidate3.vote_for!}
    6.times {candidate4.vote_for!}
    6.times {candidate5.vote_for!}

    expect(election.vote_counts).to eq({"Diana D" => 4, 
                                        "Roberto R" => 1,
                                        "Diego D" => 10,
                                        "Rita R" => 6,
                                        "Ida I" => 6})
  end




end