# Election Day

## Preparation

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!
  * Please include a reflection on how this challenge went for you.

## Iteration 1

Use TDD to create a `Candidate` class that responds to the following interaction pattern.

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> diana = Candidate.new({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007fd83736dbe0...>

pry(main)> diana.name
=> "Diana D"

pry(main)> diana.party
=> :democrat

pry(main)> diana.votes
=> 0

pry(main)> diana.vote_for!

pry(main)> diana.vote_for!

pry(main)> diana.vote_for!

pry(main)> diana.votes
=> 3

pry(main)> diana.vote_for!

pry(main)> diana.votes
=> 4
```

## Iteration 2

Use TDD to create a `Race` class that responds to the following interaction pattern.

The `register_candidate!` method must take a Hash as an argument and return an instance of `Candidate`.

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> race = Race.new("Texas Governor")
=> #<Race:0x00007f9edf307688...>

pry(main)> race.office
=> "Texas Governor"

pry(main)> race.candidates
=> []

pry(main)> candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> candidate1.class
=> Candidate

pry(main)> candidate1.name
=> "Diana D"

pry(main)> candidate1.party
=> :democrat

pry(main)> candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007f9edf386780...>

pry(main)> race.candidates
=> [#<Candidate:0x00007f9edf376c90...>, #<Candidate:0x00007f9edf386780...>]
```

## Iteration 3

Use TDD to create an `Election` class that responds to the following interaction pattern.

The `vote_counts` method should return a hash with each candidate's name as a key and their count of votes as the value.

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> require './lib/election'
=> true

pry(main)> election = Election.new('2022')
=> #<Election:0x00007fd5a304b548...>

pry(main)> election.year
=> "2022"

pry(main)> election.races
=> []

pry(main)> race1 = Race.new("Virginia District 4 Representative")
=> #<Race:0x00007fd597a61480...>

pry(main)> race2 = Race.new("Texas Governor")
=> #<Race:0x00007fd5a3048640...>

pry(main)> election.add_race(race1)

pry(main)> election.add_race(race2)

pry(main)> election.races
=> [#<Race:0x00007fd597a61480...>, #<Race:0x00007fd5a3048640...>]

pry(main)> candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007fd597b22e78...>

pry(main)> candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007fd5a3018a58...>

pry(main)> candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
=> #<Candidate:0x00007fd5a3032ac0...>

pry(main)> candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
=> #<Candidate:0x00007fd597b3a938...>

pry(main)> candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
=> #<Candidate:0x00007fd597a91ae0...>

pry(main)> election.candidates
=> [#<Candidate:0x00007fd597b22e78...>,
 #<Candidate:0x00007fd5a3018a58...>,
 #<Candidate:0x00007fd5a3032ac0...>,
 #<Candidate:0x00007fd597b3a938...>,
 #<Candidate:0x00007fd597a91ae0...>]


pry(main)> 4.times {candidate1.vote_for!}

pry(main)> 1.times {candidate2.vote_for!}

pry(main)> 10.times {candidate3.vote_for!}

pry(main)> 6.times {candidate4.vote_for!}

pry(main)> 6.times {candidate5.vote_for!}

pry(main)> election.vote_counts
=> {"Diana D"=>4, "Roberto R"=>1, "Diego D"=>10, "Rita R"=>6, "Ida I"=>6}
```

## Iteration 4

Use TDD to implement the following methods on the `Race` class:

The `open?` method returns a boolean indicating whether the race is open or not. A race should be open by default.

The `close!` method should close the race (should no longer be open).

The `winner` method should return `false` if the race is still open. It should return the candidate with the most votes if not open. If there is a tie, it should return any candidate with the highest number of votes.

The `tie?` method should return a boolean indicating if two or more candidates received the highest number of votes.

Additionally, you should use TDD to implement a method for the `Election` class called `winners` that will return an array of the Candidate objects that represents the winner from each race. If the race is a tie or is still open, no winner should be returned for that race.

```ruby
pry(main)> require './lib/race'
=> true

pry(main)> require './lib/election'
=> true

pry(main)> race1 = Race.new("Texas Governor")
=> #<Race:0x00007fc7441a91c8...>

pry(main)> candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007fc7443163a8...>

pry(main)> candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007fc74429cbc0...>

pry(main)> 4.times {candidate1.vote_for!}

pry(main)> 1.times {candidate2.vote_for!}

pry(main)> race1.open?
=> true

pry(main)> race1.winner
=> false #there is no winner until the race is closed

pry(main)> race1.close!

pry(main)> race1.open?
=> false

pry(main)> race1.winner
=> #<Candidate:0x00007fc7443163a8...>

pry(main)> race2 = Race.new("Virginia District 4 Representative")
=> #<Race:0x00007fc74424e3f8...>

pry(main)> candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
=> #<Candidate:0x00007fc74482f358...>

pry(main)> candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
=> #<Candidate:0x00007fc7442ef5c8...>

pry(main)> candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
=> #<Candidate:0x00007fc7442768a8...>

pry(main)> 1.times {candidate3.vote_for!}

pry(main)> 6.times {candidate4.vote_for!}

pry(main)> 6.times {candidate5.vote_for!}

pry(main)> race2.close!

pry(main)> race2.tie?
=> true

pry(main)> race1.tie?
=> false

pry(main)> race3 = Race.new("Colorado District 5 Representative")
=> #<Race:0x00007fc7442fd4c0...>

pry(main)> race3.open?
=> true

pry(main)> election = Election.new('2022')
=> #<Election:0x00007fc7441e38f0...>

pry(main)> election.add_race(race1)

pry(main)> election.add_race(race2)

pry(main)> election.add_race(race3)

pry(main)> election.winners
=> [#<Candidate:0x00007fc7443163a8...>] #only 1 candidate expected since one race is a tie and another is still open
```
