Werewolf Game - Project directed by Maurin Yohan

- Is there a designated organizer?
<br> The leader of the game 

- Who will be the voters?
<br> Voters for the night smart contract are the werewolves
Voters for the day smart contract are all villagers

- What will the proposals be?
<br> The proposals for the voters of the night smart contract (the werewolves) are are those for the smart contract of the previous day, with excluded werewolves.
  The proposals for the voters of the smart day contract are those for the smart contract of the night before, including werewolves.

- Who can add a proposal?
<br> The leader

- How long will the vote take?
<br> The vote will last until the game is over, as long as the penultimate player of a camp is not eliminated yet.

- How will the results be calculated?
<br> The person with the most votes will be eliminated.
In case of a tie, a new vote is held between the tied persons.
In case of a new tie, one is eliminated at random from among the tied ones.

- What information is available on voters? How do we make sure everyone votes only the number of times allowed?
<br> There is a list with all the voters, if the ith element of the list is a 1 it is a werewolf and if it is 0 it is a villager
At each address we associate a vote, if it has already voted it will not be able to vote again.
