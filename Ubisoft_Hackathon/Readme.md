# The Division : Battle for Paris

This project was done by a team of people from Startups ,Banks and Public company at the Ubisoft hackathon of July 2018. It is a Blockchain based game that  innovate the way people are interacting with the players .
At the moment we use the testnet Ropsten but eventually we will use an Ethereum permittioned network firstly and then on public network where the advancement in term of privacy and scalability will be more mature.

## Code explanation
### Smart-contracts 

ERC721 stuff --> Each token is unique and represents a character's stuff (armor, knife, weapon, knee pad etc.)

ERC20 gemmes --> Currency of the game which is obtained only by playing (impossible to buy for money)

ERC20 skin --> Currency that allows to buy skins that can customize the appearance of the player but does not improve its performance.

Vote --> System of voting within a faction (i.e clan) for decisions taken within the faction (proposal of person to exlure, confrontation faction enemy, etc ...)

Exchange --> Lets you trade x gemmes (x tokens ERC20) for one stuff (1 token ERC721)

Distribut gemmes --> SC linked to a html page (use of web3) to reward a person at a certain location. As part of this project, it is imagined that there will be a contract deployed by place where we can find gems. Futhermore, it is necessary to put gems (tokens) in the contract to receive then a reward, moreover only the honor of the SC can interact with. It is therefore used for transparency.

#### Exchange SC :

ATTENTION: Before executing the Swap function use the approve function of the Gems Contract(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e), allocate a portion of your funds to this contract. (Any help is welcome to not need to do this)

Because if we put this "Gemmes(0xe02..).approve(contract_address,value_gemmes);" in swap function this will not allow the contract to spend your tokens.

Note: In place of burn tokens, it may also be possible to send them to a central entity such as Ubisoft.

### Index

This is a web page where a central entity (which has the address 0x95) can manually send datas (x, y, z, address), if these datas correspond to a GPS position located inside the zone of distribution of gems then the address will receive.

## Improvement

Make a system of metadata more or less rare in the ERC721 token, with the same matters than crytokitties. Then add in the SC exchange a pseudo-random system which takes into consideration the number of gems exchanged, which would have more or less rare metadata.

Find a system that allows you no longer need to manually allocate the right to the contract to spend our funds.

#### Feel free to post issues !!
